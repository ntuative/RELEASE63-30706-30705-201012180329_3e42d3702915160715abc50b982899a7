package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1943:int;
      
      private var var_1942:int;
      
      private var var_1941:int;
      
      private var var_1944:String;
      
      private var var_1731:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1943 = param1.readInteger();
         this.var_1942 = param1.readInteger();
         this.var_1941 = param1.readInteger();
         this.var_1944 = param1.readString();
         this.var_1731 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_1943;
      }
      
      public function get minute() : int
      {
         return this.var_1942;
      }
      
      public function get chatterId() : int
      {
         return this.var_1941;
      }
      
      public function get chatterName() : String
      {
         return this.var_1944;
      }
      
      public function get msg() : String
      {
         return this.var_1731;
      }
   }
}
