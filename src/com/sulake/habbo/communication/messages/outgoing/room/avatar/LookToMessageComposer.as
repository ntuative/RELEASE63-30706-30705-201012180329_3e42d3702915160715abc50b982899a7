package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_1967:int;
      
      private var var_1968:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         this.var_1967 = param1;
         this.var_1968 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1967,this.var_1968];
      }
      
      public function dispose() : void
      {
      }
   }
}
