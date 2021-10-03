package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1433:String;
      
      private var var_1432:int;
      
      private var var_1932:Boolean;
      
      private var var_1927:Boolean;
      
      private var var_1929:int;
      
      private var var_1931:int;
      
      private var var_1933:int;
      
      private var var_1928:int;
      
      private var var_1930:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1433 = param1.readString();
         this.var_1432 = param1.readInteger();
         this.var_1932 = param1.readBoolean();
         this.var_1927 = param1.readBoolean();
         this.var_1929 = param1.readInteger();
         this.var_1931 = param1.readInteger();
         this.var_1933 = param1.readInteger();
         this.var_1928 = param1.readInteger();
         this.var_1930 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1433;
      }
      
      public function get price() : int
      {
         return this.var_1432;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_1932;
      }
      
      public function get vip() : Boolean
      {
         return this.var_1927;
      }
      
      public function get periods() : int
      {
         return this.var_1929;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_1931;
      }
      
      public function get year() : int
      {
         return this.var_1933;
      }
      
      public function get month() : int
      {
         return this.var_1928;
      }
      
      public function get day() : int
      {
         return this.var_1930;
      }
   }
}
