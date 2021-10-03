package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.BinaryFileLoader;
   import com.sulake.core.assets.loaders.BitmapFileLoader;
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.assets.loaders.SoundFileLoader;
   import com.sulake.core.assets.loaders.ZipFileLoader;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class AssetLibrary extends EventDispatcher implements IAssetLibrary
   {
      
      public static const const_897:String = "AssetLibraryReady";
      
      public static const const_583:String = "AssetLibraryLoaded";
      
      public static const const_1499:String = "AssetLibraryUnloaded";
      
      public static const const_1495:String = "AssetLibraryLoadError";
      
      private static var var_282:Dictionary;
      
      private static var _lazyAssetProcessor:LazyAssetProcessor = new LazyAssetProcessor();
      
      private static var var_481:uint = 0;
      
      private static var var_888:Array = new Array();
       
      
      private var _name:String;
      
      private var _file:String;
      
      private var var_724:XML;
      
      private var var_890:Boolean;
      
      private var var_398:uint;
      
      private var var_36:LibraryLoader;
      
      private var var_594:Class;
      
      private var var_887:Dictionary;
      
      private var var_143:Dictionary;
      
      private var var_889:Boolean = true;
      
      private var var_482:Dictionary;
      
      private var var_397:Array;
      
      private var var_396:Dictionary;
      
      public function AssetLibrary(param1:String)
      {
         super();
         this._name = param1;
         this.var_724 = new XML();
         this.var_398 = 0;
         this.var_397 = new Array();
         if(var_282 == null)
         {
            var_282 = new Dictionary(false);
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/octet-stream",UnknownAsset,BinaryFileLoader));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-shockwave-flash",DisplayAsset,BitmapFileLoader,"swf"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-font-truetype",FontAsset,BinaryFileLoader,"ttf","otf"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("application/zip",UnknownAsset,ZipFileLoader,"zip"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("text/xml",XmlAsset,BinaryFileLoader,"xml"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("text/html",XmlAsset,BinaryFileLoader,"htm","html"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("text/plain",TextAsset,BinaryFileLoader,"txt"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/jpeg",BitmapDataAsset,BitmapFileLoader,"jpg","jpeg"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/gif",BitmapDataAsset,BitmapFileLoader,"gif"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/png",BitmapDataAsset,BitmapFileLoader,"png"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("image/tiff",BitmapDataAsset,BitmapFileLoader,"tif","tiff"));
            this.registerAssetTypeDeclaration(new AssetTypeDeclaration("sound/mp3",SoundAsset,SoundFileLoader,"mp3"));
         }
         ++var_481;
         this.var_396 = new Dictionary(false);
         this.var_482 = new Dictionary(false);
         this.var_887 = new Dictionary(false);
         this.var_143 = new Dictionary(false);
         var_888.push(this);
      }
      
      public static function get numAssetLibraryInstances() : uint
      {
         return var_481;
      }
      
      public static function get assetLibraryRefArray() : Array
      {
         return var_888;
      }
      
      private static function fetchLibraryContents(param1:AssetLibrary, param2:XML, param3:Class) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param3 == null)
         {
            throw new Error("Library " + param1._file + " doesn\'t contain valid resource class!");
         }
         var _loc4_:XMLList = param2.child("library");
         if(_loc4_ == null)
         {
            throw Error("Provided manifest doesn\'t contain library node!");
         }
         _loc4_ = _loc4_[0].assets;
         if(_loc4_ != null)
         {
            _loc4_ = _loc4_.child("asset");
            _loc9_ = _loc4_.length();
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc5_ = _loc4_[_loc10_];
               _loc6_ = _loc5_.attribute("name");
               _loc7_ = param1.getAssetTypeDeclarationByMimeType(_loc5_.attribute("mimeType"));
               if(_loc7_ != null)
               {
                  _loc8_ = new _loc7_.assetClass(_loc7_) as IAsset;
                  _loc8_.setUnknownContent(param3[_loc6_]);
                  if(_loc5_.child("param").length())
                  {
                     _loc8_.setParamsDesc(_loc5_.child("param"));
                  }
                  param1.setAsset(_loc6_,_loc8_);
               }
               else
               {
                  Logger.log("Failed to extract asset " + _loc6_ + " from Library " + param1._file + "!");
               }
               _loc10_++;
            }
         }
         return true;
      }
      
      public function get url() : String
      {
         return this._file;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get isReady() : Boolean
      {
         return this.var_890;
      }
      
      public function get manifest() : XML
      {
         return this.var_724;
      }
      
      public function get numAssets() : uint
      {
         return this.var_398;
      }
      
      public function get nameArray() : Array
      {
         return this.var_397;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this.unload();
            super.dispose();
            var_888.splice(var_888.indexOf(this),1);
            --var_481;
            this.var_482 = null;
            this.var_887 = null;
            this.var_143 = null;
            this.var_397 = null;
            this.var_724 = null;
            this.var_398 = 0;
            this.var_890 = false;
            this._name = null;
         }
      }
      
      public function loadFromFile(param1:LibraryLoader, param2:Boolean = true) : void
      {
         if(this._file == param1.url && this.var_890)
         {
            if(!this.var_889 && param2)
            {
               AssetLibrary.fetchLibraryContents(this,this.var_724,this.var_594);
            }
            this.var_889 = param2;
            dispatchEvent(new Event(AssetLibrary.const_897));
         }
         else
         {
            if(this.var_36 == null || this.var_36.disposed)
            {
               this.var_36 = param1;
               this.var_36.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.libraryLoadedHandler);
               this.var_36.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.loadErrorHandler);
            }
            this.var_889 = param2;
            this._file = this.var_36.url;
         }
      }
      
      public function loadFromResource(param1:XML, param2:Class) : Boolean
      {
         return AssetLibrary.fetchLibraryContents(this,param1,param2);
      }
      
      public function unload() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for(_loc1_ in this.var_482)
         {
            _loc2_ = this.var_482[_loc1_];
            _loc2_.assetLoader.dispose();
            delete this.var_482[_loc1_];
         }
         for(_loc1_ in this.var_143)
         {
            delete this.var_143[_loc1_];
         }
         for(_loc1_ in this.var_887)
         {
            delete this.var_887[_loc1_];
         }
         if(this.var_36 != null)
         {
            this.var_36.dispose();
            this.var_36 = null;
         }
         this.var_398 = 0;
         this.var_890 = false;
         this._file = null;
         dispatchEvent(new Event(AssetLibrary.const_1499));
      }
      
      public function getClass(param1:String) : Class
      {
         var _loc2_:Class = this.var_887[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         if(this.var_36 != null)
         {
            if(this.var_36.hasDefinition(param1))
            {
               _loc2_ = this.var_36.getDefinition(param1) as Class;
               if(_loc2_ != null)
               {
                  this.var_887[param1] = _loc2_;
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function loadAssetFromFile(param1:String, param2:URLRequest, param3:String = null) : AssetLoaderStruct
      {
         var _loc5_:* = null;
         if(this.getAssetByName(param1) != null)
         {
            throw new Error("Asset with name " + param1 + " already exists!");
         }
         var _loc4_:AssetLoaderStruct = this.var_482[param2.url];
         if(_loc4_ != null)
         {
            if(_loc4_.assetName == param1)
            {
               return _loc4_;
            }
         }
         if(param3 == null)
         {
            _loc5_ = this.solveAssetTypeDeclarationFromUrl(param2.url);
            if(_loc5_ == null)
            {
               throw new Error("Couldn\'t solve asset type for file " + param2.url + "!");
            }
         }
         else
         {
            _loc5_ = this.getAssetTypeDeclarationByMimeType(param3,true);
            if(_loc5_ == null)
            {
               throw new Error("Asset type declaration for mime type " + param3 + "not found!");
            }
         }
         var _loc6_:IAssetLoader = new _loc5_.loaderClass(_loc5_.mimeType,param2);
         if(_loc6_ == null)
         {
            throw new Error("Invalid file loader class defined for mime type " + param3 + "!");
         }
         _loc6_.addEventListener(AssetLoaderEvent.const_30,this.assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_43,this.assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_1013,this.assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_1090,this.assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_911,this.assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_891,this.assetLoadEventHandler);
         _loc4_ = new AssetLoaderStruct(param1,_loc6_);
         this.var_482[param2.url] = _loc4_;
         return _loc4_;
      }
      
      private function assetLoadEventHandler(param1:AssetLoaderEvent) : void
      {
         var loader:IAssetLoader = null;
         var type:String = null;
         var decl:AssetTypeDeclaration = null;
         var asset:IAsset = null;
         var e:AssetLoaderEvent = param1;
         var remove:Boolean = false;
         loader = e.target as IAssetLoader;
         if(loader == null)
         {
            throw new Error("Failed to downcast object to asset loader!");
         }
         var struct:AssetLoaderStruct = this.var_482[loader.url];
         if(struct == null)
         {
            throw new Error("Asset loader structure was lost!");
         }
         switch(e.type)
         {
            case AssetLoaderEvent.const_30:
               type = loader.mimeType;
               decl = this.getAssetTypeDeclarationByMimeType(type);
               remove = true;
               if(decl != null)
               {
                  asset = new decl.assetClass(decl,loader.url);
                  try
                  {
                     asset.setUnknownContent(loader.content);
                  }
                  catch(error:Error)
                  {
                     asset.dispose();
                     e = new AssetLoaderEvent(AssetLoaderEvent.const_43,e.status);
                     break;
                  }
                  if(this.var_143[struct.assetName] == null)
                  {
                     ++this.var_398;
                     this.var_397.push(struct.assetName);
                  }
                  this.var_143[struct.assetName] = asset;
               }
               else
               {
                  e = new AssetLoaderEvent(AssetLoaderEvent.const_43,e.status);
               }
               break;
            case AssetLoaderEvent.const_43:
               remove = true;
         }
         struct.dispatchEvent(new AssetLoaderEvent(e.type,e.status));
         if(remove)
         {
            if(!_disposed && loader)
            {
               delete this.var_482[loader.url];
            }
            if(struct)
            {
               struct.dispose();
            }
         }
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         var _loc2_:IAsset = this.var_143[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         if(this.var_889)
         {
            return null;
         }
         return this.fetchAssetFromResource(param1);
      }
      
      public function getAssetByIndex(param1:uint) : IAsset
      {
         return param1 < this.var_397.length ? this.getAssetByName(this.var_397[param1]) : null;
      }
      
      public function getAssetByContent(param1:Object) : IAsset
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in this.var_143)
         {
            _loc3_ = this.var_143[_loc2_];
            if(_loc3_.content === param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getAssetIndex(param1:IAsset) : int
      {
         var _loc2_:* = null;
         for(_loc2_ in this.var_143)
         {
            if(this.var_143[_loc2_] == param1)
            {
               return this.var_397.indexOf(_loc2_);
            }
         }
         return -1;
      }
      
      public function hasAsset(param1:String) : Boolean
      {
         return this.var_143[param1] != null || (this.var_594 != null ? this.var_594[param1] != null : false);
      }
      
      public function setAsset(param1:String, param2:IAsset, param3:Boolean = true) : Boolean
      {
         var _loc4_:* = this.var_143[param1] == null;
         if((param3 || _loc4_) && param2)
         {
            if(_loc4_)
            {
               ++this.var_398;
               this.var_397.push(param1);
            }
            this.var_143[param1] = param2;
            if(param2 is ILazyAsset)
            {
               _lazyAssetProcessor.push(param2 as ILazyAsset);
            }
            return true;
         }
         return false;
      }
      
      public function createAsset(param1:String, param2:AssetTypeDeclaration) : IAsset
      {
         if(this.hasAsset(param1) || !param2)
         {
            return null;
         }
         var _loc3_:* = new param2.assetClass(param2);
         if(!this.setAsset(param1,_loc3_))
         {
            _loc3_.dispose();
            _loc3_ = null;
         }
         return _loc3_;
      }
      
      public function removeAsset(param1:IAsset) : IAsset
      {
         var _loc2_:* = null;
         if(param1)
         {
            for(_loc2_ in this.var_143)
            {
               if(this.var_143[_loc2_] == param1)
               {
                  this.var_397.splice(this.var_397.indexOf(_loc2_),1);
                  delete this.var_143[_loc2_];
                  --this.var_398;
                  return param1;
               }
            }
         }
         return null;
      }
      
      public function registerAssetTypeDeclaration(param1:AssetTypeDeclaration, param2:Boolean = true) : Boolean
      {
         if(param2)
         {
            if(var_282.hasOwnProperty(param1.mimeType))
            {
               throw new Error("Asset type " + param1.mimeType + " already registered!");
            }
            var_282[param1.mimeType] = param1;
         }
         else
         {
            if(this.var_396.hasOwnProperty(param1.mimeType))
            {
               throw new Error("Asset type " + param1.mimeType + " already registered!");
            }
            this.var_396[param1.mimeType] = param1;
         }
         return true;
      }
      
      public function getAssetTypeDeclarationByMimeType(param1:String, param2:Boolean = true) : AssetTypeDeclaration
      {
         var _loc3_:* = null;
         if(param2)
         {
            _loc3_ = AssetTypeDeclaration(var_282[param1]);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         _loc3_ = AssetTypeDeclaration(this.var_396[param1]);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return null;
      }
      
      public function getAssetTypeDeclarationByClass(param1:Class, param2:Boolean = true) : AssetTypeDeclaration
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2)
         {
            for(_loc4_ in var_282)
            {
               _loc3_ = AssetTypeDeclaration(var_282[_loc4_]);
               if(_loc3_ != null)
               {
                  if(_loc3_.assetClass == param1)
                  {
                     return _loc3_;
                  }
               }
            }
         }
         for(_loc4_ in this.var_396)
         {
            _loc3_ = AssetTypeDeclaration(this.var_396[_loc4_]);
            if(_loc3_ != null)
            {
               if(_loc3_.assetClass == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function getAssetTypeDeclarationByFileName(param1:String, param2:Boolean = true) : AssetTypeDeclaration
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:String = param1.substr(param1.lastIndexOf(".") + 1,param1.length);
         if(_loc3_.indexOf("?"))
         {
            _loc3_ = _loc3_.substr(0,_loc3_.indexOf("?") - 1);
         }
         if(param2)
         {
            for(_loc5_ in var_282)
            {
               _loc4_ = AssetTypeDeclaration(var_282[_loc5_]);
               if(_loc4_ != null)
               {
                  if(_loc4_.fileTypes.indexOf(_loc3_))
                  {
                     return _loc4_;
                  }
               }
            }
         }
         for(_loc5_ in this.var_396)
         {
            _loc4_ = AssetTypeDeclaration(this.var_396[_loc5_]);
            if(_loc4_ != null)
            {
               if(_loc4_.fileTypes.indexOf(_loc3_))
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      private function libraryLoadedHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_.manifest == null)
         {
            throw new Error("loader.manifest was null, which would have caused error 1009 anyway. See HL-22347.");
         }
         this.var_724 = _loc2_.manifest.copy();
         this.var_594 = _loc2_.resource;
         this._file = _loc2_.url;
         if(this.var_889)
         {
            AssetLibrary.fetchLibraryContents(this,this.var_724,this.var_594);
         }
         this.var_890 = true;
         dispatchEvent(new Event(AssetLibrary.const_583));
         dispatchEvent(new Event(AssetLibrary.const_897));
         if(this.var_889)
         {
            this.var_36.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.libraryLoadedHandler);
            this.var_36.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.loadErrorHandler);
            this.var_36.addEventListener(LibraryLoader.LIBRARY_LOADER_FINALIZE,this.finalizeLoaderEventHandler);
            this.var_36 = null;
            this.var_594 = null;
         }
      }
      
      private function finalizeLoaderEventHandler(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_ && !_loc2_.disposed)
         {
            if(!_loc2_.hasEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE))
            {
               _loc2_.removeEventListener(LibraryLoader.LIBRARY_LOADER_FINALIZE,this.finalizeLoaderEventHandler);
               _loc2_.dispose();
            }
         }
      }
      
      private function onLoadProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function loadErrorHandler(param1:LibraryLoaderEvent) : void
      {
         this.var_890 = false;
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = !!_loc2_ ? _loc2_.name : "unknown";
         Logger.log("Cannot load the specified file: " + _loc3_);
         dispatchEvent(new Event(AssetLibrary.const_1495));
         this.var_36 = null;
      }
      
      private function solveAssetTypeDeclarationFromUrl(param1:String) : AssetTypeDeclaration
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > 0)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ == -1)
         {
            return null;
         }
         param1 = param1.slice(_loc2_ + 1,param1.length);
         for(_loc5_ in this.var_396)
         {
            _loc3_ = this.var_396[_loc5_];
            _loc4_ = _loc3_.fileTypes;
            if(_loc4_ != null)
            {
               if(_loc4_.indexOf(param1,0) > -1)
               {
                  return _loc3_;
               }
            }
         }
         for(_loc5_ in var_282)
         {
            _loc3_ = var_282[_loc5_];
            _loc4_ = _loc3_.fileTypes;
            if(_loc4_ != null)
            {
               if(_loc4_.indexOf(param1,0) > -1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      private function fetchAssetFromResource(param1:String) : IAsset
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!this.var_594)
         {
            return null;
         }
         var _loc2_:XMLList = this.var_724.child("library");
         if(_loc2_ == null)
         {
            throw new Error("Provided manifest doesn\'t contain library node!");
         }
         if(_loc2_.length() == 0)
         {
            return null;
         }
         _loc2_ = _loc2_[0].assets;
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.child("asset");
            _loc5_ = null;
            _loc6_ = _loc2_.length();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_ = _loc2_[_loc7_];
               if(_loc3_.attribute("name").toString() == param1)
               {
                  _loc4_ = this.getAssetTypeDeclarationByMimeType(_loc3_.attribute("mimeType"));
                  if(_loc4_ == null)
                  {
                     throw new Error("Failed to extract asset " + param1 + " from Library " + this._file + "!");
                  }
                  _loc5_ = new _loc4_.assetClass(_loc4_) as IAsset;
                  _loc5_.setUnknownContent(this.var_594[param1]);
                  if(_loc3_.child("param").length())
                  {
                     _loc5_.setParamsDesc(_loc3_.child("param"));
                  }
                  this.setAsset(param1,_loc5_);
                  return _loc5_;
               }
               _loc7_++;
            }
         }
         return null;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + this._name;
      }
   }
}
