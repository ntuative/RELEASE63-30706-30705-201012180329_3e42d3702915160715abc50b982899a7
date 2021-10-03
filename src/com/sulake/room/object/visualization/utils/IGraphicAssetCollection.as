package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.IAssetLibrary;
   import flash.display.BitmapData;
   
   public interface IGraphicAssetCollection
   {
       
      
      function dispose() : void;
      
      function set assetLibrary(param1:IAssetLibrary) : void;
      
      function define(param1:XML) : Boolean;
      
      function getAsset(param1:String) : IGraphicAsset;
      
      function addAsset(param1:String, param2:BitmapData, param3:Boolean, param4:int = 0, param5:int = 0) : Boolean;
      
      function disposeAsset(param1:String) : void;
   }
}
