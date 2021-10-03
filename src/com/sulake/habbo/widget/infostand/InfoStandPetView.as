package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class InfoStandPetView
   {
       
      
      private var _widget:InfostandWidget;
      
      private var _window:IItemListWindow;
      
      private var var_207:IBorderWindow;
      
      private var var_63:IItemListWindow;
      
      private var var_50:IItemListWindow;
      
      private var var_183:PetCommandTool;
      
      private var var_1359:Map;
      
      private var var_548:int;
      
      private const const_1847:int = 158;
      
      private const const_1851:int = 16;
      
      private const const_1848:uint = 11184810;
      
      private const const_1843:uint = 6710886;
      
      private const const_1846:uint = 3355443;
      
      private const const_1844:String = "level";
      
      private const const_1850:String = "experience";
      
      private const const_1845:String = "energy";
      
      private const const_1849:String = "nutrition";
      
      public function InfoStandPetView(param1:InfostandWidget, param2:String)
      {
         super();
         this._widget = param1;
         this.createWindow(param2);
         this.var_1359 = new Map();
      }
      
      public function dispose() : void
      {
         this._widget = null;
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
         if(this.var_183)
         {
            this.var_183.dispose();
         }
         this.var_183 = null;
      }
      
      public function get window() : IItemListWindow
      {
         return this._window;
      }
      
      private function updateWindow() : void
      {
         if(this.var_50 == null || this.var_207 == null || this.var_63 == null)
         {
            return;
         }
         this.var_63.width = this.var_63.scrollableRegion.width;
         this.var_63.visible = this.var_63.width > 0;
         this.var_50.height = this.var_50.scrollableRegion.height;
         this.var_207.height = this.var_50.height + 20;
         this._window.width = Math.max(this.var_207.width,this.var_63.width);
         this._window.height = this._window.scrollableRegion.height;
         if(this.var_207.width < this.var_63.width)
         {
            this.var_207.x = this._window.width - this.var_207.width;
            this.var_63.x = 0;
         }
         else
         {
            this.var_63.x = this._window.width - this.var_63.width;
            this.var_207.x = 0;
         }
         this._widget.refreshContainer();
      }
      
      public function update(param1:InfoStandPetData) : void
      {
         this.name = param1.name;
         this.image = param1.image;
         this.ownerName = param1.ownerName;
         this.raceText = this._widget.localizations.getKey(this.getRaceLocalizationKey(param1.type,param1.race));
         this.petRespect = param1.petRespect;
         this.ageText = param1.age;
         this.updateStateElement(this.const_1844,param1.level,param1.levelMax);
         this.updateStateElement(this.const_1850,param1.experience,param1.experienceMax);
         this.updateStateElement(this.const_1845,param1.energy,param1.energyMax);
         this.updateStateElement(this.const_1849,param1.nutrition,param1.nutritionMax);
         this.showButton("pick",param1.isOwnPet);
         this.showButton("train",param1.isOwnPet);
         this.showButton("kick",param1.canOwnerBeKicked);
         this.updateRespectButton();
         this.updateWindow();
         this.var_548 = param1.id;
         this.var_1359.remove(param1.id);
         this.var_1359.add(param1.id,param1);
         if(this.var_183 && this.var_183.isVisible() && param1.isOwnPet)
         {
            this.var_183.showCommandToolForPet(param1.id,param1.name,param1.image);
         }
      }
      
      public function getCurrentPetId() : int
      {
         return this.var_548;
      }
      
      public function updateEnabledTrainingCommands(param1:int, param2:Array) : void
      {
         if(this.var_183 == null)
         {
            return;
         }
         this.var_183.method_15(param1,param2);
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         if(param2 < 10)
         {
            _loc3_ = "00" + param2;
         }
         else if(param2 < 100)
         {
            _loc3_ = "0" + param2;
         }
         return "pet.race." + param1 + "." + _loc3_;
      }
      
      private function createPercentageBar(param1:int, param2:int) : BitmapData
      {
         param2 = Math.max(param2,1);
         param1 = Math.max(param1,0);
         if(param1 > param2)
         {
            param1 = param2;
         }
         var _loc3_:Number = param1 / param2;
         var _loc5_:BitmapData = new BitmapData(this.const_1847,this.const_1851,false);
         _loc5_.fillRect(new Rectangle(0,0,_loc5_.width,_loc5_.height),this.const_1848);
         var _loc6_:Rectangle = new Rectangle(1,1,_loc5_.width - 2,_loc5_.height - 2);
         _loc5_.fillRect(_loc6_,this.const_1846);
         var _loc7_:Rectangle = new Rectangle(1,1,_loc5_.width - 2,_loc5_.height - 2);
         _loc7_.width = _loc3_ * _loc7_.width;
         _loc5_.fillRect(_loc7_,this.const_1843);
         return _loc5_;
      }
      
      private function openTrainView() : void
      {
         if(this.var_183 == null)
         {
            this.var_183 = new PetCommandTool(this._widget);
         }
         var _loc1_:InfoStandPetData = this.var_1359.getValue(this.var_548) as InfoStandPetData;
         if(_loc1_ != null)
         {
            this.var_183.showWindow(true);
            this.var_183.showCommandToolForPet(_loc1_.id,_loc1_.name,_loc1_.image);
         }
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:XmlAsset = this._widget.assets.getAssetByName("pet_view") as XmlAsset;
         this._window = (this._widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as IItemListWindow;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this.var_207 = this._window.getListItemByName("info_border") as IBorderWindow;
         if(this.var_207 != null)
         {
            this.var_50 = this.var_207.findChildByName("infostand_element_list") as IItemListWindow;
         }
         this._window.name = param1;
         this._widget.mainContainer.addChild(this._window);
         var _loc3_:IWindow = this.var_207.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
         this.var_63 = this._window.getListItemByName("button_list") as IItemListWindow;
         if(this.var_63 == null)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < this.var_63.numListItems)
         {
            _loc9_ = this.var_63.getListItemAt(_loc4_) as IRegionWindow;
            if(_loc9_ != null)
            {
               _loc5_ = _loc9_.getChildAt(0);
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClicked);
            }
            _loc4_++;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_207.findChildByName("petrespect_icon") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc10_ = this._widget.assets.getAssetByName("icon_petrespect") as BitmapDataAsset;
            _loc11_ = _loc10_.content as BitmapData;
            _loc6_.bitmap = _loc11_.clone();
         }
         var _loc7_:* = [];
         this.var_63.groupListItemsWithTag("CMD_BUTTON",_loc7_,true);
         for each(_loc8_ in _loc7_)
         {
            if(_loc8_.parent)
            {
               _loc8_.parent.width = _loc8_.width;
            }
            _loc8_.addEventListener(WindowEvent.const_45,this.onButtonResized);
         }
      }
      
      private function set name(param1:String) : void
      {
         if(this.var_50 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = this.var_50.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      private function set image(param1:BitmapData) : void
      {
         if(this.var_50 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this.var_50.getListItemByName("image_container") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _loc2_.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,param1.height,true,0);
         var _loc5_:Point = new Point(0,0);
         _loc5_.x = (_loc3_.width - param1.width) / 2;
         _loc4_.copyPixels(param1,param1.rect,_loc5_);
         _loc3_.height = param1.height;
         _loc3_.bitmap = _loc4_;
         _loc3_.invalidate();
         this.updateWindow();
      }
      
      private function set ownerName(param1:String) : void
      {
         this._widget.localizations.registerParameter("infostand.text.petowner","name",param1);
         this.updateWindow();
      }
      
      private function set raceText(param1:String) : void
      {
         if(this.var_50 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = this.var_50.getListItemByName("race_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         this.updateWindow();
      }
      
      private function set ageText(param1:int) : void
      {
         if(this.var_50 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = this.var_50.getListItemByName("age_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this._widget.localizations.registerParameter("pet.age","age",param1.toString());
         this.updateWindow();
      }
      
      private function set petRespect(param1:int) : void
      {
         this._widget.localizations.registerParameter("infostand.text.petrespect","count",param1.toString());
         if(this.var_50 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this.var_50.getListItemByName("petrespect_container") as IWindowContainer;
         var _loc3_:ITextWindow = _loc2_.findChildByName("petrespect_text") as ITextWindow;
         var _loc4_:IBitmapWrapperWindow = _loc2_.findChildByName("petrespect_icon") as IBitmapWrapperWindow;
         _loc4_.x = _loc3_.x + _loc3_.width + 2;
         this.updateWindow();
      }
      
      private function updateStateElement(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:* = null;
         if(this.var_50 == null)
         {
            return;
         }
         var _loc4_:IWindowContainer = this.var_50.getListItemByName("status_container") as IWindowContainer;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:ITextWindow = _loc4_.findChildByName("status_" + param1 + "_value_text") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.text = param2 + "/" + param3;
         }
         var _loc6_:IBitmapWrapperWindow = _loc4_.findChildByName("status_" + param1 + "_bitmap") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc7_ = this.createPercentageBar(param2,param3);
            if(_loc7_ != null)
            {
               _loc6_.bitmap = _loc7_;
               _loc6_.width = _loc7_.width;
               _loc6_.height = _loc7_.height;
               _loc6_.invalidate();
            }
         }
         this.updateWindow();
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:IWindow = param1.target as IWindow;
         switch(_loc4_.name)
         {
            case "btn_pick":
               _loc3_ = "null";
               if(this.var_183 && this.var_183.getPetId() == this.var_548)
               {
                  this.var_183.showWindow(false);
               }
               break;
            case "btn_train":
               this.openTrainView();
               break;
            case "btn_petrespect":
               --this._widget.userData.petRespectLeft;
               this.updateRespectButton();
               _loc3_ = "null";
               break;
            case "btn_kick":
               _loc2_ = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_442,this._widget.petData.ownerId);
               this._widget.messageListener.processWidgetMessage(_loc2_);
               return;
         }
         if(_loc3_ != null)
         {
            _loc5_ = this._widget.petData.id;
            _loc2_ = new RoomWidgetUserActionMessage(_loc3_,_loc5_);
            this._widget.messageListener.processWidgetMessage(_loc2_);
         }
         this.updateWindow();
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         this._widget.close();
      }
      
      private function updateRespectButton() : void
      {
         if(this.var_63 == null)
         {
            return;
         }
         var _loc1_:IRegionWindow = this.var_63.getListItemByName("petrespect") as IRegionWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindow = _loc1_.findChildByName("btn_petrespect") as IButtonWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = this._widget.userData.petRespectLeft;
         this._widget.localizations.registerParameter("infostand.button.petrespect","count",_loc3_.toString());
         _loc1_.visible = _loc3_ > 0;
         this.var_63.arrangeListItems();
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(this.var_63 == null)
         {
            return;
         }
         var _loc3_:IWindow = this.var_63.getListItemByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            this.var_63.arrangeListItems();
         }
      }
      
      protected function onButtonResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window.parent;
         if(_loc2_ && _loc2_.tags.indexOf("CMD_BUTTON_REGION") > -1)
         {
            _loc2_.width = param1.window.width;
         }
      }
   }
}
