package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1363:int;
      
      private var var_1364:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1363 = this.var_1363;
         _loc1_.var_1364 = this.var_1364;
         return _loc1_;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1363 = param1;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1364 = param1;
      }
      
      public function get pos() : int
      {
         return this.var_1363;
      }
      
      public function get imgId() : int
      {
         return this.var_1364;
      }
   }
}
