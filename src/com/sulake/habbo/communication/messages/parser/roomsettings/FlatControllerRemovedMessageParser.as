package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatControllerRemovedMessageParser implements IMessageParser
   {
       
      
      private var var_343:int;
      
      private var _userId:int;
      
      public function FlatControllerRemovedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_343 = param1.readInteger();
         this._userId = param1.readInteger();
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_343;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
