package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1324:String = "pricing_model_unknown";
      
      public static const const_492:String = "pricing_model_single";
      
      public static const const_505:String = "pricing_model_multi";
      
      public static const const_415:String = "pricing_model_bundle";
      
      public static const const_1310:String = "price_type_none";
      
      public static const const_603:String = "price_type_credits";
      
      public static const const_1049:String = "price_type_activitypoints";
      
      public static const const_1093:String = "price_type_credits_and_activitypoints";
       
      
      private var var_736:String;
      
      private var var_1107:String;
      
      private var _offerId:int;
      
      private var var_1790:String;
      
      private var var_1108:int;
      
      private var var_1109:int;
      
      private var var_1679:int;
      
      private var var_392:ICatalogPage;
      
      private var var_735:IProductContainer;
      
      private var var_2509:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1790 = param1.localizationId;
         this.var_1108 = param1.priceInCredits;
         this.var_1109 = param1.priceInActivityPoints;
         this.var_1679 = param1.activityPointType;
         this.var_392 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_392;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1790;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1108;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1109;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1679;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_735;
      }
      
      public function get pricingModel() : String
      {
         return this.var_736;
      }
      
      public function get priceType() : String
      {
         return this.var_1107;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2509;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2509 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1790 = "";
         this.var_1108 = 0;
         this.var_1109 = 0;
         this.var_1679 = 0;
         this.var_392 = null;
         if(this.var_735 != null)
         {
            this.var_735.dispose();
            this.var_735 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_736)
         {
            case const_492:
               this.var_735 = new SingleProductContainer(this,param1);
               break;
            case const_505:
               this.var_735 = new MultiProductContainer(this,param1);
               break;
            case const_415:
               this.var_735 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_736);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_736 = const_492;
            }
            else
            {
               this.var_736 = const_505;
            }
         }
         else if(param1.length > 1)
         {
            this.var_736 = const_415;
         }
         else
         {
            this.var_736 = const_1324;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1108 > 0 && this.var_1109 > 0)
         {
            this.var_1107 = const_1093;
         }
         else if(this.var_1108 > 0)
         {
            this.var_1107 = const_603;
         }
         else if(this.var_1109 > 0)
         {
            this.var_1107 = const_1049;
         }
         else
         {
            this.var_1107 = const_1310;
         }
      }
   }
}
