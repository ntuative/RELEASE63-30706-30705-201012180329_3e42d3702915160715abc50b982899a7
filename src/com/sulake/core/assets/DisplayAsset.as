package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_936:String;
      
      protected var var_160:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_767:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_767 = param1;
         this.var_936 = param2;
      }
      
      public function get url() : String
      {
         return this.var_936;
      }
      
      public function get content() : Object
      {
         return this.var_160;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_767;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_160.loaderInfo != null)
            {
               if(this.var_160.loaderInfo.loader != null)
               {
                  this.var_160.loaderInfo.loader.unload();
               }
            }
            this.var_160 = null;
            this.var_767 = null;
            this._disposed = true;
            this.var_936 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_160 = param1 as DisplayObject;
            if(this.var_160 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_160 = DisplayAsset(param1).var_160;
            this.var_767 = DisplayAsset(param1).var_767;
            if(this.var_160 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_160 = DisplayAsset(param1).var_160;
            this.var_767 = DisplayAsset(param1).var_767;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
