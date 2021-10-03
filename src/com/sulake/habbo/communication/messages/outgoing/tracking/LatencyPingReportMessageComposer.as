package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2520:int;
      
      private var var_2522:int;
      
      private var var_2521:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2520 = param1;
         this.var_2522 = param2;
         this.var_2521 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2520,this.var_2522,this.var_2521];
      }
      
      public function dispose() : void
      {
      }
   }
}
