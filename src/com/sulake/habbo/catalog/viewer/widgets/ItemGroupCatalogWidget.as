package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class ItemGroupCatalogWidget extends ItemGridCatalogWidget implements ICatalogWidget, IItemGrid
   {
       
      
      private var _groupNames:Array;
      
      private var var_615:Array;
      
      private var var_1137:int = 0;
      
      private var var_1832:int = 0;
      
      public function ItemGroupCatalogWidget(param1:IWindowContainer)
      {
         this._groupNames = new Array();
         this.var_615 = new Array();
         super(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function init() : void
      {
         Logger.log("Init Item Group Catalog Widget (Plasto)");
         this.createOfferGroups();
         var_178 = false;
         super.init();
         events.addEventListener(WidgetEvent.CWE_WIDGETS_INITIALIZED,this.onWidgetsInitialized);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,this.onColourIndex);
      }
      
      public function onWidgetsInitialized(param1:CatalogWidgetsInitializedEvent) : void
      {
         var _loc2_:Offer = this.var_615[this.var_1137][this.var_1832];
         this.select(_loc2_.productContainer as IGridItem);
      }
      
      override public function select(param1:IGridItem) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return;
         }
         super.select(param1);
         this.var_1137 = var_1170.getGridItemIndex(param1.view);
         var _loc2_:String = this._groupNames[this.var_1137];
         var _loc3_:Array = this.var_615[this.var_1137] as Array;
         var _loc4_:Array = new Array();
         for each(_loc5_ in _loc3_)
         {
            _loc6_ = _loc5_.productContainer.firstProduct.furnitureData;
            _loc7_ = _loc6_.colours[_loc6_.colours.length - 1];
            _loc4_.push(_loc7_);
         }
         Logger.log("Show the colors for current selection..." + _loc2_ + " " + _loc4_.length);
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc4_,"ctlg_clr_40x32_1","ctlg_clr_40x32_2","ctlg_clr_40x32_3"));
      }
      
      override protected function populateItemGrid() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_615)
         {
            if(this.var_1832 < _loc1_.length)
            {
               _loc2_ = _loc1_[this.var_1832] as Offer;
               createGridItem(_loc2_);
               loadGraphics(_loc2_);
               _loc2_.productContainer.grid = this;
            }
         }
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         var _loc2_:int = param1.index;
         var _loc3_:Array = this.var_615[this.var_1137] as Array;
         var _loc4_:Offer = _loc3_[_loc2_] as Offer;
         if(_loc4_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc4_));
         }
      }
      
      private function createOfferGroups() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         for each(_loc1_ in page.offers)
         {
            if(_loc1_.pricingModel == Offer.const_492 || _loc1_.pricingModel == Offer.const_505)
            {
               _loc3_ = _loc1_.productContainer.firstProduct;
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.productClassId;
                  if(_loc3_.productType == ProductTypeEnum.const_79 || _loc3_.productType == ProductTypeEnum.const_82)
                  {
                     if(_loc3_.furnitureData != null)
                     {
                        _loc5_ = _loc3_.furnitureData.name;
                        if(this._groupNames.indexOf(_loc5_) == -1)
                        {
                           this._groupNames.push(_loc5_);
                           this.var_615.push(new Array());
                        }
                        _loc6_ = this._groupNames.indexOf(_loc5_);
                        (this.var_615[_loc6_] as Array).push(_loc1_);
                     }
                  }
               }
            }
         }
         for each(_loc2_ in this.var_615)
         {
            _loc2_.sort(this.sortByColor);
         }
      }
      
      private function sortByColor(param1:Offer, param2:Offer) : int
      {
         var _loc3_:Number = param1.productContainer.firstProduct.furnitureData.colourIndex;
         var _loc4_:Number = param2.productContainer.firstProduct.furnitureData.colourIndex;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
   }
}
