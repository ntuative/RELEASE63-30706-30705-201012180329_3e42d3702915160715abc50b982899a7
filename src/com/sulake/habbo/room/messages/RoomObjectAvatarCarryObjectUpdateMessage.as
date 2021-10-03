package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1325:int;
      
      private var var_1687:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         this.var_1325 = param1;
         this.var_1687 = param2;
      }
      
      public function get itemType() : int
      {
         return this.var_1325;
      }
      
      public function get itemName() : String
      {
         return this.var_1687;
      }
   }
}
