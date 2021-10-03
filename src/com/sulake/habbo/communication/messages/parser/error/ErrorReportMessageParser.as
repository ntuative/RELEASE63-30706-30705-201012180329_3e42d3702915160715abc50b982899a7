package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1444:int;
      
      private var var_1739:int;
      
      private var var_1740:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1739 = param1.readInteger();
         this.var_1444 = param1.readInteger();
         this.var_1740 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1444 = 0;
         this.var_1739 = 0;
         this.var_1740 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1444;
      }
      
      public function get messageId() : int
      {
         return this.var_1739;
      }
      
      public function get timestamp() : String
      {
         return this.var_1740;
      }
   }
}
