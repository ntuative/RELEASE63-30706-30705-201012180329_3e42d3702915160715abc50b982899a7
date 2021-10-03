package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class FurnitureGiftWrappedVisualization extends FurnitureVisualization
   {
       
      
      private var var_2089:int = 0;
      
      private var var_2088:int = 0;
      
      public function FurnitureGiftWrappedVisualization()
      {
         super();
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         this.updateTypes();
         super.update(param1,param2,param3);
      }
      
      private function updateTypes() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:IRoomObject = object;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getModel();
            if(_loc2_ != null)
            {
               _loc3_ = 1000;
               _loc4_ = _loc2_.getString(RoomObjectVariableEnum.const_536);
               _loc5_ = parseInt(_loc4_);
               this.var_2089 = Math.floor(_loc5_ / _loc3_);
               this.var_2088 = _loc5_ % _loc3_;
            }
         }
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         if(param1 <= 1)
         {
            return this.var_2089;
         }
         return this.var_2088;
      }
      
      override protected function getSpriteAssetName(param1:int, param2:Number) : String
      {
         if(_data == null)
         {
            return "";
         }
         var _loc3_:int = _data.getSize(param2);
         var _loc4_:String = _type;
         var _loc5_:String = "";
         if(param1 < spriteCount - 1)
         {
            _loc5_ = String.fromCharCode("a".charCodeAt() + param1);
         }
         else
         {
            _loc5_ = "sd";
         }
         var _loc6_:int = this.getFrameNumber(param1,param2);
         _loc4_ += "_" + _loc3_ + "_" + _loc5_ + "_" + _direction;
         return _loc4_ + ("_" + _loc6_);
      }
   }
}
