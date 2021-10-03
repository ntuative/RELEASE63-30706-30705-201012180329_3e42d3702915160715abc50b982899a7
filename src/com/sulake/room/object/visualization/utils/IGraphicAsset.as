package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.IAsset;
   
   public interface IGraphicAsset
   {
       
      
      function get flipV() : Boolean;
      
      function get flipH() : Boolean;
      
      function get asset() : IAsset;
      
      function get name() : String;
      
      function get offsetX() : int;
      
      function get offsetY() : int;
   }
}
