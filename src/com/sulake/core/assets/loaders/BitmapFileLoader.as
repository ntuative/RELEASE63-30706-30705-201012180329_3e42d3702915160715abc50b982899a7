package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_936:String;
      
      protected var _type:String;
      
      protected var var_36:Loader;
      
      protected var var_938:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_936 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_36 = new Loader();
         this.var_938 = new LoaderContext();
         this.var_938.checkPolicyFile = true;
         this.var_36.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_36.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         this.var_36.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_36.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_36.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_36.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            this.var_36.load(param2,this.var_938);
         }
      }
      
      public function get url() : String
      {
         return this.var_936;
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function get content() : Object
      {
         return !!this.var_36 ? this.var_36.content : null;
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this.var_36 ? uint(this.var_36.contentLoaderInfo.bytesLoaded) : uint(0);
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_36 ? uint(this.var_36.contentLoaderInfo.bytesTotal) : uint(0);
      }
      
      public function get loaderContext() : LoaderContext
      {
         return this.var_938;
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_936 = param1.url;
         var_290 = 0;
         this.var_36.load(param1,this.var_938);
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_290 < var_2642)
            {
               try
               {
                  this.var_36.close();
                  this.var_36.unload();
               }
               catch(e:Error)
               {
               }
               this.var_36.load(new URLRequest(this.var_936 + (this.var_936.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_290),this.var_938);
               return true;
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_36.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_36.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            this.var_36.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_36.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_36.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_36.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               this.var_36.close();
            }
            catch(e:*)
            {
            }
            this.var_36.unload();
            this.var_36 = null;
            this._type = null;
            this.var_936 = null;
         }
      }
   }
}
