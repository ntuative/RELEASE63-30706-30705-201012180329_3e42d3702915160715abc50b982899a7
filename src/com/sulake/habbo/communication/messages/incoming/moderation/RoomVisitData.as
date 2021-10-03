package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_1727:Boolean;
      
      private var _roomId:int;
      
      private var var_789:String;
      
      private var var_2292:int;
      
      private var var_2293:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1727 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_789 = param1.readString();
         this.var_2292 = param1.readInteger();
         this.var_2293 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1727;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_789;
      }
      
      public function get enterHour() : int
      {
         return this.var_2292;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2293;
      }
   }
}
