package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.ActivityPointDisplayCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.BotCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.CatalogWidgetEnum;
   import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ICatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGroupCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceOwnItemsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerPrizesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpacesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import flash.events.Event;
   
   public class CatalogPage implements ICatalogPage
   {
      
      protected static const const_1533:String = "ctlg_";
       
      
      protected var var_1896:XML;
      
      protected var _window:IWindowContainer;
      
      private var var_1010:ICatalogViewer;
      
      private var _pageId:int;
      
      private var var_1044:String;
      
      private var _offers:Array;
      
      private var _localization:IPageLocalization;
      
      private var var_57:Array;
      
      private var var_1305:EventDispatcher;
      
      private var _catalog:HabboCatalog;
      
      private var var_1304:ItemGridCatalogWidget;
      
      public function CatalogPage(param1:ICatalogViewer, param2:int, param3:String, param4:IPageLocalization, param5:Array, param6:HabboCatalog)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         this.var_57 = [];
         super();
         this.var_1010 = param1;
         this._pageId = param2;
         this.var_1044 = param3;
         this._localization = param4;
         this._offers = new Array();
         this._catalog = param6;
         for each(_loc7_ in param5)
         {
            _loc8_ = new Offer(_loc7_,this);
            if(_loc8_.productContainer != null)
            {
               this._offers.push(_loc8_);
            }
            else
            {
               _loc8_.dispose();
            }
         }
         this.var_1305 = new EventDispatcher();
         this.var_57 = new Array();
         this.init();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get viewer() : ICatalogViewer
      {
         return this.var_1010;
      }
      
      public function get pageId() : int
      {
         return this._pageId;
      }
      
      public function get layoutCode() : String
      {
         return this.var_1044;
      }
      
      public function get offers() : Array
      {
         return this._offers;
      }
      
      public function get localization() : IPageLocalization
      {
         return this._localization;
      }
      
      public function get links() : Array
      {
         return this._localization.getLinks(this.var_1044);
      }
      
      public function get hasLinks() : Boolean
      {
         return this._localization.hasLinks(this.var_1044);
      }
      
      public function selectOffer(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_1304 != null)
         {
            Logger.log("selecting offer " + param1);
            for each(_loc2_ in this._offers)
            {
               if(_loc2_.offerId == param1)
               {
                  _loc3_ = _loc2_.productContainer as IGridItem;
                  this.var_1304.select(_loc3_);
               }
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_57)
         {
            _loc1_.dispose();
         }
         this.var_57 = null;
         this._localization.dispose();
         for each(_loc2_ in this._offers)
         {
            _loc2_.dispose();
         }
         if(this._window != null)
         {
            this._window.dispose();
         }
         this._window = null;
         this.var_1010 = null;
         this.var_1896 = null;
         this._pageId = 0;
         this.var_1044 = "";
      }
      
      public function init() : void
      {
         this.createWindow(this.layoutCode);
         this.createWidgets();
      }
      
      protected function createWindow(param1:String) : void
      {
         var _loc2_:String = const_1533 + param1;
         var _loc3_:XmlAsset = this.viewer.catalog.assets.getAssetByName(_loc2_) as XmlAsset;
         if(_loc3_ == null)
         {
            Logger.log("Could not find asset for layout " + _loc2_);
            return;
         }
         this.var_1896 = _loc3_.content as XML;
         this._window = this.viewer.catalog.windowManager.buildFromXML(this.var_1896) as IWindowContainer;
         if(this._window == null)
         {
            Logger.log("Could not create layout " + param1);
         }
      }
      
      private function localize() : void
      {
      }
      
      private function createWidgets() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._window == null)
         {
            return;
         }
         this.var_57.push(new LocalizationCatalogWidget(this._window));
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1287) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_1304 = new ItemGridCatalogWidget(_loc1_);
            this.var_57.push(this.var_1304);
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1346) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new ItemGroupCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1353) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new ProductViewCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1294) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new SingleViewCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1374) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new PurchaseCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1507) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new PurseCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1465) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new ColourGridCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1474) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new TraxPreviewCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1428) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new RedeemItemCodeCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1286) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new SpacesCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1522) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new TrophyCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1514) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new PetsCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1258) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new BotCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1365) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new TextInputCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1459) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new SpecialInfoWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1523) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new RecyclerCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1311) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new RecyclerPrizesCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1425) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new MarketPlaceCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1291) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new MarketPlaceOwnItemsCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1299) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new ClubGiftWidget(_loc1_,this._catalog.getClubGiftController()));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1404) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new ClubBuyCatalogWidget(_loc1_));
         }
         _loc1_ = this._window.findChildByName(CatalogWidgetEnum.const_1403) as IWindowContainer;
         if(_loc1_ != null)
         {
            this.var_57.push(new ActivityPointDisplayCatalogWidget(_loc1_));
         }
         for each(_loc2_ in this.var_57)
         {
            _loc2_.page = this;
            _loc2_.events = this.var_1305;
            _loc2_.init();
         }
         this.var_1305.dispatchEvent(new CatalogWidgetsInitializedEvent());
      }
      
      public function dispatchWidgetEvent(param1:Event) : Boolean
      {
         return this.var_1305.dispatchEvent(param1);
      }
   }
}
