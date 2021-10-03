package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1276:Boolean;
      
      private var var_1024:Boolean;
      
      private var var_1275:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1276;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1024;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1275;
      }
      
      public function flush() : Boolean
      {
         this.var_1276 = false;
         this.var_1024 = false;
         this.var_1275 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1276 = param1.readBoolean();
         this.var_1024 = param1.readBoolean();
         this.var_1275 = param1.readBoolean();
         return true;
      }
   }
}
