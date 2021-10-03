package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1562:int = 0;
      
      private var var_1563:int = 0;
      
      private var var_1679:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1562;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1563;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1679;
      }
      
      public function flush() : Boolean
      {
         this.var_1562 = 0;
         this.var_1563 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1562 = param1.readInteger();
         this.var_1563 = param1.readInteger();
         this.var_1679 = param1.readInteger();
         return true;
      }
   }
}
