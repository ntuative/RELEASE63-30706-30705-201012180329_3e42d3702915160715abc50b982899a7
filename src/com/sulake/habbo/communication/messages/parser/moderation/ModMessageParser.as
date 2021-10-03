package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ModMessageParser implements IMessageParser
   {
       
      
      private var _message:String;
      
      private var var_936:String;
      
      public function ModMessageParser()
      {
         super();
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get url() : String
      {
         return this.var_936;
      }
      
      public function flush() : Boolean
      {
         this._message = "";
         this.var_936 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._message = param1.readString();
         this.var_936 = param1.readString();
         return true;
      }
   }
}
