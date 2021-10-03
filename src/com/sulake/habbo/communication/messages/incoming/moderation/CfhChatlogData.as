package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1533:int;
      
      private var var_2084:int;
      
      private var var_1253:int;
      
      private var var_2083:int;
      
      private var var_111:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1533 = param1.readInteger();
         this.var_2084 = param1.readInteger();
         this.var_1253 = param1.readInteger();
         this.var_2083 = param1.readInteger();
         this.var_111 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1533);
      }
      
      public function get callId() : int
      {
         return this.var_1533;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2084;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1253;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2083;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_111;
      }
   }
}
