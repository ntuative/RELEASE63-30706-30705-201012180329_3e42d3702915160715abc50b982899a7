package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public class ColourGridCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1234:Array;
      
      private var _colourGrid:IItemGridWindow;
      
      private var var_1516:XML;
      
      private var var_649:BitmapData;
      
      private var var_1081:BitmapData;
      
      private var var_878:BitmapData;
      
      private var var_325:IWindowContainer;
      
      public function ColourGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         this._colourGrid.destroyGridItems();
         this._colourGrid.dispose();
         this._colourGrid = null;
         this.var_1516 = null;
         this.var_325 = null;
         super.dispose();
      }
      
      override public function init() : void
      {
         super.init();
         this._colourGrid = _window.findChildByName("colourGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("color_chooser_cell") as XmlAsset;
         this.var_1516 = _loc1_.content as XML;
         events.addEventListener(WidgetEvent.CWE_COLOUR_ARRAY,this.onAvailableColours);
      }
      
      private function onAvailableColours(param1:CatalogWidgetColoursEvent) : void
      {
         this.var_1234 = param1.colours;
         var _loc2_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset;
         this.var_649 = _loc2_.content as BitmapData;
         var _loc3_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         this.var_1081 = _loc3_.content as BitmapData;
         var _loc4_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         this.var_878 = _loc4_.content as BitmapData;
         this.populateColourGrid();
         this.select(this._colourGrid.getGridItemAt(0) as IWindowContainer);
      }
      
      private function select(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         Logger.log("[ColourGridCatalogWidget] Select: " + param1);
         if(this.var_325 != null)
         {
            _loc2_ = this.var_325.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         this.var_325 = param1;
         if(this.var_325 != null)
         {
            _loc2_ = this.var_325.getChildByName("chosen");
         }
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      private function populateColourGrid() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = 0;
         Logger.log("[ColourGridCatalogWidget] Display colors: " + [this.var_1234.length,this._colourGrid.numGridItems]);
         this._colourGrid.destroyGridItems();
         this.var_325 = null;
         for each(_loc1_ in this.var_1234)
         {
            _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_1516) as IWindowContainer;
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
            _loc2_.background = true;
            _loc2_.color = 4294967295;
            _loc2_.width = this.var_649.width;
            _loc2_.height = this.var_649.height;
            this._colourGrid.addGridItem(_loc2_);
            _loc3_ = _loc2_.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap = new BitmapData(this.var_649.width,this.var_649.height,true,0);
               _loc3_.bitmap.copyPixels(this.var_649,this.var_649.rect,new Point(0,0));
            }
            _loc4_ = _loc2_.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
            if(_loc4_ != null)
            {
               _loc4_.bitmap = new BitmapData(this.var_1081.width,this.var_1081.height,true,0);
               _loc6_ = 255;
               _loc7_ = 255;
               _loc8_ = 255;
               if(_loc1_ > 0)
               {
                  _loc14_ = uint(uint(_loc1_));
                  _loc6_ = uint(_loc14_ >> 16 & 255);
                  _loc7_ = uint(_loc14_ >> 8 & 255);
                  _loc8_ = uint(_loc14_ >> 0 & 255);
               }
               _loc9_ = _loc6_ / 255 * 1;
               _loc10_ = _loc7_ / 255 * 1;
               _loc11_ = _loc8_ / 255 * 1;
               _loc12_ = new ColorTransform(_loc9_,_loc10_,_loc11_);
               _loc13_ = this.var_1081.clone();
               _loc13_.colorTransform(_loc13_.rect,_loc12_);
               _loc4_.bitmap.copyPixels(_loc13_,_loc13_.rect,new Point(0,0));
            }
            _loc5_ = _loc2_.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               _loc5_.bitmap = new BitmapData(this.var_878.width,this.var_878.height,true,16777215);
               _loc5_.bitmap.copyPixels(this.var_878,this.var_878.rect,new Point(0,0),null,null,true);
               _loc5_.visible = false;
            }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         this.select(param1.target as IWindowContainer);
         var _loc2_:int = this._colourGrid.getGridItemIndex(param1.target as IWindow);
         var _loc3_:int = 0;
         if(_loc2_ >= 0)
         {
            _loc3_ = this.var_1234[_loc2_];
         }
         events.dispatchEvent(new CatalogWidgetColourIndexEvent(_loc2_));
      }
   }
}
