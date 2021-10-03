package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2060:int = 0;
      
      private var var_1345:String = "";
      
      private var var_1713:String = "";
      
      private var var_2393:String = "";
      
      private var var_2395:String = "";
      
      private var var_1695:int = 0;
      
      private var var_2394:int = 0;
      
      private var var_2391:int = 0;
      
      private var var_1346:int = 0;
      
      private var var_2392:int = 0;
      
      private var var_1348:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2060 = param1;
         this.var_1345 = param2;
         this.var_1713 = param3;
         this.var_2393 = param4;
         this.var_2395 = param5;
         if(param6)
         {
            this.var_1695 = 1;
         }
         else
         {
            this.var_1695 = 0;
         }
         this.var_2394 = param7;
         this.var_2391 = param8;
         this.var_1346 = param9;
         this.var_2392 = param10;
         this.var_1348 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2060,this.var_1345,this.var_1713,this.var_2393,this.var_2395,this.var_1695,this.var_2394,this.var_2391,this.var_1346,this.var_2392,this.var_1348];
      }
   }
}
