package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1313:Boolean;
      
      private var var_2323:int;
      
      private var var_1784:int;
      
      private var var_1783:int;
      
      private var var_2324:int;
      
      private var var_2326:int;
      
      private var var_2322:int;
      
      private var var_2325:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1313;
      }
      
      public function get commission() : int
      {
         return this.var_2323;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1784;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1783;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2326;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2324;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2322;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2325;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1313 = param1.readBoolean();
         this.var_2323 = param1.readInteger();
         this.var_1784 = param1.readInteger();
         this.var_1783 = param1.readInteger();
         this.var_2326 = param1.readInteger();
         this.var_2324 = param1.readInteger();
         this.var_2322 = param1.readInteger();
         this.var_2325 = param1.readInteger();
         return true;
      }
   }
}
