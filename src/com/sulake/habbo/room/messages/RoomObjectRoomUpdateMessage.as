package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_614:String = "RORUM_ROOM_WALL_UPDATE";
      
      public static const const_774:String = "RORUM_ROOM_FLOOR_UPDATE";
      
      public static const const_598:String = "RORUM_ROOM_LANDSCAPE_UPDATE";
       
      
      private var _type:String = "";
      
      private var var_168:String = "";
      
      public function RoomObjectRoomUpdateMessage(param1:String, param2:String)
      {
         super(null,null);
         this._type = param1;
         this.var_168 = param2;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get value() : String
      {
         return this.var_168;
      }
   }
}
