package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IBreed;
   import com.sulake.habbo.avatar.pets.IPetColor;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.pets.IPetDataListener;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class PetsCatalogWidget extends CatalogWidget implements ICatalogWidget, IPetDataListener, IPetImageListener
   {
       
      
      private var _offers:Map;
      
      private var _name:String;
      
      private var var_874:int = -1;
      
      private var var_1708:int = 0;
      
      private var var_472:int = 0;
      
      private var var_875:Boolean = false;
      
      private var var_585:Array;
      
      private var var_331:Array;
      
      private var var_693:Boolean = false;
      
      public function PetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_693)
         {
            return;
         }
         if(page && false && page.viewer.catalog)
         {
            _loc1_ = page.viewer.catalog as HabboCatalog;
            if(_loc1_ && _loc1_.avatarRenderManager)
            {
               _loc1_.avatarRenderManager.removePetImageListener(this);
               if(_loc1_.avatarRenderManager.petDataManager)
               {
                  _loc1_.avatarRenderManager.petDataManager.removeListener(this);
               }
            }
         }
         this.var_875 = false;
         this._offers.dispose();
         this._offers = null;
         this.var_585 = null;
         this.var_331 = null;
         super.dispose();
         this.var_693 = true;
      }
      
      override public function init() : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         super.init();
         this.var_875 = false;
         var _loc1_:IWindow = window.findChildByName("ctlg_buy_button");
         var _loc2_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(WindowEvent.const_104,this.onTextWindowEvent);
         this._offers = new Map();
         var _loc3_:Array = new Array();
         var _loc4_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         if(page.offers.length == 0)
         {
            return;
         }
         var _loc5_:Offer = page.offers[0];
         this.var_874 = this.getPetTypeIndexFromProduct(_loc5_.localizationId);
         this.var_331 = [];
         this.var_585 = [];
         if(page && false && page.viewer.catalog)
         {
            _loc8_ = page.viewer.catalog as HabboCatalog;
            if(_loc8_ && _loc8_.avatarRenderManager && _loc8_.avatarRenderManager.petDataManager)
            {
               _loc9_ = _loc8_.avatarRenderManager.petDataManager.getPetData(this.var_874,this);
               if(_loc9_)
               {
                  this.var_585 = _loc9_.sellableBreeds;
                  this.var_331 = _loc9_.colors;
                  if(this.var_331 == null)
                  {
                     this.var_331 = [];
                  }
               }
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.var_585.length)
         {
            _loc10_ = this.var_585[_loc6_] as IBreed;
            _loc3_.push(_loc4_.getKey(this.getRaceLocalizationKey(this.var_874,_loc10_.id),this.getRaceLocalizationKey(this.var_874,_loc10_.id)));
            _loc6_++;
         }
         this._offers.add(this.var_874,_loc5_);
         var _loc7_:IDropMenuWindow = window.findChildByName("type_drop_menu") as IDropMenuWindow;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc3_.length > 1)
         {
            _loc7_.populate(_loc3_);
            _loc7_.selection = 0;
            _loc7_.procedure = this.onDropMenuEvent;
            _loc7_.visible = true;
         }
         else
         {
            _loc7_.visible = false;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,this.onColourIndex);
         events.addEventListener(WidgetEvent.const_1034,this.onApproveNameResult);
         events.addEventListener(WidgetEvent.CWE_WIDGETS_INITIALIZED,this.onWidgetsInitialized);
      }
      
      private function onWidgetsInitialized(param1:CatalogWidgetsInitializedEvent = null) : void
      {
         var _loc4_:* = null;
         if(this.var_693)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(this.onPurchase));
         var _loc2_:Offer = this._offers.getWithIndex(0);
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
         var _loc3_:* = [];
         for each(_loc4_ in this.var_331)
         {
            _loc3_.push(_loc4_.rgb);
         }
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc3_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
      }
      
      private function onPurchase(param1:WindowEvent) : void
      {
         if(this.var_875)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(this.getPurchaseParameters() == "")
         {
            return;
         }
         this.var_875 = true;
         (page.viewer.catalog as HabboCatalog).approveName(this._name,1);
      }
      
      public function onDropMenuEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowEvent.const_60)
         {
            _loc3_ = IDropMenuWindow(param2).selection;
            if(_loc3_ >= this.var_585.length)
            {
               return;
            }
            this.var_1708 = _loc3_;
            this.updateImage();
         }
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this._name = _loc2_.text;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.updateImage();
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_472 = param1.index;
         if(this.var_472 < 0 || this.var_472 > this.var_331.length)
         {
            this.var_472 = 0;
         }
         this.updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !this.var_875)
         {
            return;
         }
         this.var_875 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.long}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.short}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
         }
         var p:String = this.getPurchaseParameters();
         if(p == "")
         {
            Logger.log("* Not enough information to buy a pet!");
            return;
         }
         Logger.log("* Will buy pet as " + p);
         (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this._offers.getWithIndex(0),page.pageId,p);
      }
      
      private function updateImage() : void
      {
         var _loc7_:* = null;
         var _loc1_:Offer = this._offers.getWithIndex(0);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:* = 0;
         if(this.var_472 >= 0 && this.var_472 < this.var_331.length)
         {
            _loc7_ = this.var_331[this.var_472] as IPetColor;
            if(_loc7_ != null)
            {
               _loc2_ = uint(_loc7_.rgb);
            }
         }
         var _loc3_:IBreed = this.var_585[this.var_1708] as IBreed;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IAvatarImage = (page.viewer.catalog as HabboCatalog).avatarRenderManager.createPetImage(this.var_874,_loc3_.id,_loc2_,AvatarScaleType.const_49,this);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.initActionAppends();
         _loc4_.appendAction(AvatarAction.const_261,AvatarAction.const_795);
         _loc4_.endActionAppends();
         _loc4_.setDirection(AvatarSetType.const_32,2);
         this.setPreviewImage(_loc4_.getCroppedImage(AvatarSetType.const_32),true);
         _loc4_.dispose();
         var _loc5_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc6_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc5_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc6_.caption = "${catalog.purchase.price.credits}";
         }
      }
      
      private function getPurchaseParameters() : String
      {
         if(this._name == null || this._name.length == 0)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         if(this.var_472 >= this.var_331.length)
         {
            return "";
         }
         var petColor:IPetColor = this.var_331[this.var_472] as IPetColor;
         var color:uint = petColor.rgb;
         var breed:IBreed = this.var_585[this.var_1708] as IBreed;
         var p:String = this._name + String.fromCharCode(10) + this.addZeroPadding(String(breed.id),3) + String.fromCharCode(10) + this.addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(true)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            _loc3_ = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc4_ = 2;
               _loc5_ = new BitmapData(param1.width * _loc4_,param1.height * _loc4_,true,16777215);
               _loc5_.draw(param1,new Matrix(_loc4_,0,0,_loc4_));
               _loc6_ = new Point((_loc3_.width - _loc5_.width) / 2,(_loc3_.height - _loc5_.height) / 2);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,_loc6_,null,null,true);
               _loc3_.invalidate();
               _loc5_.dispose();
            }
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         return int(param1.charAt(param1.length - 1));
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.race." + param1 + "." + this.addZeroPadding(String(param2),3);
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public function petImageReady(param1:String) : void
      {
         if(this.var_693)
         {
            return;
         }
         this.updateImage();
      }
      
      public function petDataReady() : void
      {
         if(this.var_693)
         {
            return;
         }
         this.init();
         this.onWidgetsInitialized();
      }
   }
}
