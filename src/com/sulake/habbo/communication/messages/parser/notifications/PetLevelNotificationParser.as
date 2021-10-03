package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1561:int;
      
      private var var_2113:String;
      
      private var var_1297:int;
      
      private var var_568:String;
      
      private var var_1190:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1561 = param1.readInteger();
         this.var_2113 = param1.readString();
         this.var_1297 = param1.readInteger();
         this.var_568 = param1.readString();
         this.var_1190 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1561;
      }
      
      public function get petName() : String
      {
         return this.var_2113;
      }
      
      public function get level() : int
      {
         return this.var_1297;
      }
      
      public function get figure() : String
      {
         return this.var_568;
      }
      
      public function get petType() : int
      {
         return this.var_1190;
      }
   }
}
