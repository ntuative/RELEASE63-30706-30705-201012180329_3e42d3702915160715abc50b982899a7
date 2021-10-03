package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1017:int;
      
      private var var_2305:String;
      
      private var var_2304:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1017 = param1.readInteger();
         this.var_2305 = param1.readString();
         this.var_2304 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1017;
      }
      
      public function get requesterName() : String
      {
         return this.var_2305;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2304;
      }
   }
}
