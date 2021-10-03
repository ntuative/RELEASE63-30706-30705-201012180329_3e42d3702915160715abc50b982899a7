package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserRightsMessageParser implements IMessageParser
   {
       
      
      protected var var_818:Array = null;
      
      public function UserRightsMessageParser()
      {
         super();
         this.var_818 = [];
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_818 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_818.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get rights() : Array
      {
         return this.var_818.slice();
      }
   }
}
