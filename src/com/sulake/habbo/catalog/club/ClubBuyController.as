package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubOffersMessageEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class ClubBuyController
   {
       
      
      private var _visualization:ClubBuyCatalogWidget;
      
      private var _catalog:HabboCatalog;
      
      private var _offers:Array;
      
      private var var_202:ClubBuyConfirmationDialog;
      
      public function ClubBuyController(param1:HabboCatalog)
      {
         super();
         this._catalog = param1;
      }
      
      public function dispose() : void
      {
         if(this._visualization != null)
         {
            this._visualization.dispose();
            this._visualization = null;
         }
         this.reset();
         this.closeConfirmation();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._offers)
         {
            _loc1_.dispose();
         }
         this._offers = [];
      }
      
      public function onOffers(param1:HabboClubOffersMessageEvent) : void
      {
         var status:int = 0;
         var parser:HabboClubOffersMessageParser = null;
         var vipOffers:int = 0;
         var vipOffer:ClubBuyOfferData = null;
         var offer:ClubOfferData = null;
         var clubOffer:ClubBuyOfferData = null;
         var offerData:ClubBuyOfferData = null;
         var event:HabboClubOffersMessageEvent = param1;
         status = 0;
         try
         {
            parser = event.getParser();
            status = 1;
            this.reset();
            status = 2;
            this._visualization.reset();
            status = 3;
            this._visualization.initClubType(this.getClubType());
            status = 4;
            this._offers = [];
            vipOffers = 0;
            for each(offer in parser.offers)
            {
               offerData = new ClubBuyOfferData(offer.offerId,offer.productCode,offer.price,offer.upgrade,offer.vip,offer.periods,offer.daysLeftAfterPurchase,offer.year,offer.month,offer.day);
               this._offers.push(offerData);
               if(offer.vip)
               {
                  vipOffers++;
                  vipOffer = offerData;
               }
            }
            status = 5;
            if(vipOffers == 1)
            {
               vipOffer.upgradeHcPeriodToVip = true;
            }
            status = 6;
            this._offers.sort(this.orderByPrecedence);
            status = 7;
            for each(clubOffer in this._offers)
            {
               this._visualization.showOffer(clubOffer);
            }
            status = 8;
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("ClubBuyController","onOffers crashed, status = " + String(status) + "!");
            throw e;
         }
      }
      
      public function registerVisualization(param1:ClubBuyCatalogWidget) : void
      {
         this._visualization = param1;
      }
      
      public function requestOffers() : void
      {
         this._catalog.getHabboClubOffers();
      }
      
      public function showConfirmation(param1:ClubBuyOfferData, param2:int) : void
      {
         this.closeConfirmation();
         this.var_202 = new ClubBuyConfirmationDialog(this,param1,param2);
      }
      
      public function confirmSelection(param1:ClubBuyOfferData, param2:int) : void
      {
         if(!this._catalog || !this._catalog.connection)
         {
            return;
         }
         this._catalog.purchaseProduct(param2,param1.offerId);
         this.closeConfirmation();
      }
      
      public function closeConfirmation() : void
      {
         if(this.var_202)
         {
            this.var_202.dispose();
            this.var_202 = null;
         }
      }
      
      public function getClubType() : int
      {
         var _loc1_:int = 0;
         if(this._catalog.getPurse().hasClubLeft)
         {
            _loc1_ = !!this._catalog.getPurse().isVIP ? 0 : int(HabboClubLevelEnum.const_58);
         }
         return _loc1_;
      }
      
      public function get hasClub() : Boolean
      {
         if(!this._catalog || !this._catalog.getPurse())
         {
            return false;
         }
         return this._catalog.getPurse().clubDays > 0;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.windowManager;
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.localization;
      }
      
      public function get assets() : IAssetLibrary
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.assets;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.roomEngine;
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.getProductData(param1);
      }
      
      public function getPurse() : IPurse
      {
         if(!this._catalog)
         {
            return null;
         }
         return this._catalog.getPurse();
      }
      
      private function orderByPrecedence(param1:ClubBuyOfferData, param2:ClubBuyOfferData) : Number
      {
         var _loc3_:Number = param1.periods;
         var _loc4_:Number = param2.periods;
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return 0;
      }
   }
}
