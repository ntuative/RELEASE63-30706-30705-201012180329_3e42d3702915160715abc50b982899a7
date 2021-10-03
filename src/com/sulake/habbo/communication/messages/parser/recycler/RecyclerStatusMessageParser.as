package com.sulake.habbo.communication.messages.parser.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RecyclerStatusMessageParser implements IMessageParser
   {
       
      
      private var _recyclerStatus:int = -1;
      
      private var var_1602:int = 0;
      
      public function RecyclerStatusMessageParser()
      {
         super();
      }
      
      public function get recyclerStatus() : int
      {
         return this._recyclerStatus;
      }
      
      public function get recyclerTimeoutSeconds() : int
      {
         return this.var_1602;
      }
      
      public function flush() : Boolean
      {
         this._recyclerStatus = -1;
         this.var_1602 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._recyclerStatus = param1.readInteger();
         this.var_1602 = param1.readInteger();
         return true;
      }
   }
}
