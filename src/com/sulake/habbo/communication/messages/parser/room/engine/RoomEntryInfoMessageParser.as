package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1772:Boolean;
      
      private var var_2477:int;
      
      private var var_407:Boolean;
      
      private var var_1098:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1772;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2477;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1098;
      }
      
      public function get owner() : Boolean
      {
         return this.var_407;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1098 != null)
         {
            this.var_1098.dispose();
            this.var_1098 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1772 = param1.readBoolean();
         if(this.var_1772)
         {
            this.var_2477 = param1.readInteger();
            this.var_407 = param1.readBoolean();
         }
         else
         {
            this.var_1098 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
