package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_777:IAssetLoader;
      
      private var var_1854:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1854 = param1;
         this.var_777 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1854;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_777;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_777 != null)
            {
               if(!this.var_777.disposed)
               {
                  this.var_777.dispose();
                  this.var_777 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
