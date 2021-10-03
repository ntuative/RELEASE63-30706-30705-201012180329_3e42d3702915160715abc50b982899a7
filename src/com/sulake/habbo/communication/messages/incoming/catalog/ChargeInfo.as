package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_1940:int;
      
      private var var_2005:int;
      
      private var var_1108:int;
      
      private var var_1109:int;
      
      private var var_1679:int;
      
      private var var_2006:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_1940 = param1.readInteger();
         this.var_2005 = param1.readInteger();
         this.var_1108 = param1.readInteger();
         this.var_1109 = param1.readInteger();
         this.var_1679 = param1.readInteger();
         this.var_2006 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_1940;
      }
      
      public function get charges() : int
      {
         return this.var_2005;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1108;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1109;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2006;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1679;
      }
   }
}
