package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1433:String;
      
      private var var_1432:int;
      
      private var var_1932:Boolean;
      
      private var var_1927:Boolean;
      
      private var var_1929:int;
      
      private var var_1931:int;
      
      private var var_392:ICatalogPage;
      
      private var var_1933:int;
      
      private var var_1928:int;
      
      private var var_1930:int;
      
      private var var_1934:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1433 = param2;
         this.var_1432 = param3;
         this.var_1932 = param4;
         this.var_1927 = param5;
         this.var_1929 = param6;
         this.var_1931 = param7;
         this.var_1933 = param8;
         this.var_1928 = param9;
         this.var_1930 = param10;
      }
      
      public function dispose() : void
      {
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_483;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1432;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_392;
      }
      
      public function get priceType() : String
      {
         return Offer.const_603;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1433;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_392 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_1934;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_1934 = param1;
      }
   }
}
