package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PetsView implements IInventoryView, IPetImageListener
   {
       
      
      private const const_1858:int = 0;
      
      private const const_861:int = 1;
      
      private const const_1568:int = 2;
      
      private const const_1567:int = 3;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _view:IWindowContainer;
      
      private var var_62:PetsModel;
      
      private var _disposed:Boolean = false;
      
      private var var_470:IItemGridWindow;
      
      private var _avatarRenderer:IAvatarRenderManager;
      
      private var var_578:Map;
      
      private var var_325:PetsGridItem;
      
      private var var_2368:int = 0;
      
      public function PetsView(param1:PetsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IAvatarRenderManager)
      {
         var _loc10_:* = null;
         super();
         this.var_62 = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         this._avatarRenderer = param5;
         this.var_578 = new Map();
         var _loc6_:XmlAsset = this._assetLibrary.getAssetByName("inventory_pets_view_xml") as XmlAsset;
         if(_loc6_ == null || _loc6_.content == null)
         {
            return;
         }
         this._view = this._windowManager.buildFromXML(_loc6_.content as XML) as IWindowContainer;
         if(this._view == null)
         {
            return;
         }
         this._view.visible = false;
         this._view.procedure = this.windowEventHandler;
         this.var_470 = this._view.findChildByName("grid") as IItemGridWindow;
         var _loc7_:IBitmapWrapperWindow = this._view.findChildByName("download_image") as IBitmapWrapperWindow;
         _loc7_.bitmap = new BitmapData(_loc7_.width,_loc7_.height);
         var _loc8_:BitmapData = this._assetLibrary.getAssetByName("download_icon_png").content as BitmapData;
         _loc7_.bitmap.copyPixels(_loc8_,_loc8_.rect,new Point((_loc7_.width - _loc8_.width) / 2,(_loc7_.height - _loc8_.height) / 2),null,null,true);
         _loc7_ = this._view.findChildByName("image") as IBitmapWrapperWindow;
         _loc7_.bitmap = new BitmapData(_loc7_.width,_loc7_.height);
         var _loc9_:BitmapData = this._assetLibrary.getAssetByName("inventory_empty_png").content as BitmapData;
         _loc7_.bitmap.copyPixels(_loc9_,_loc9_.rect,new Point((_loc7_.width - _loc9_.width) / 2,(_loc7_.height - _loc9_.height) / 2),null,null,true);
         _loc10_ = this._view.findChildByName("place_button") as IButtonWindow;
         if(_loc10_ != null)
         {
            _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.placeButtonClickHandler);
         }
         _loc10_ = this._view.findChildByName("open_catalog_btn") as IButtonWindow;
         if(_loc10_ != null)
         {
            _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.catalogButtonClickHandler);
         }
         this.selectPetsTab();
         this.updatePreview();
         this.setViewToState();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._windowManager = null;
            this.var_62 = null;
            this._view = null;
            this._disposed = true;
         }
      }
      
      public function update() : void
      {
         this.updateGrid();
         this.updatePreview(this.var_325);
      }
      
      public function removePet(param1:int) : void
      {
         var _loc2_:PetsGridItem = this.var_578.remove(param1) as PetsGridItem;
         if(_loc2_ == null)
         {
            return;
         }
         this.var_470.removeGridItem(_loc2_.window);
         if(this.var_325 == _loc2_)
         {
            this.var_325 = null;
            this.selectFirst();
         }
      }
      
      private function selectFirst() : void
      {
         if(this.var_578 == null || this.var_578.length == 0)
         {
            this.updatePreview();
            return;
         }
         this.setSelectedGridItem(this.var_578.getWithIndex(0));
      }
      
      public function addPet(param1:PetData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_578.getValue(param1.id) != null)
         {
            return;
         }
         var _loc2_:PetsGridItem = new PetsGridItem(this,param1,this._windowManager,this._assetLibrary,this._avatarRenderer);
         if(_loc2_ != null)
         {
            this.var_470.addGridItem(_loc2_.window);
            this.var_578.add(param1.id,_loc2_);
            if(this.var_325 == null)
            {
               this.selectFirst();
            }
         }
      }
      
      private function updateGrid() : void
      {
         var _loc2_:* = null;
         if(this._view == null)
         {
            return;
         }
         this.var_470.removeGridItems();
         this.var_578.reset();
         var _loc1_:Map = this.var_62.pets;
         if(_loc1_ == null)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            this.addPet(_loc2_);
         }
      }
      
      private function catalogButtonClickHandler(param1:WindowMouseEvent) : void
      {
         this.var_62.requestCatalogOpen();
      }
      
      private function placeButtonClickHandler(param1:WindowMouseEvent) : void
      {
         if(this.var_325 == null)
         {
            return;
         }
         var _loc2_:PetData = this.var_325.pet;
         if(_loc2_ == null)
         {
            return;
         }
         this.placePetToRoom(_loc2_.id);
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         this.var_62.placePetToRoom(param1,param2);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(this._view == null)
         {
            return null;
         }
         if(this._view.disposed)
         {
            return null;
         }
         return this._view;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowEvent.const_60)
         {
            switch(param2.name)
            {
               case "tab_floor":
                  this.var_62.switchCategory(FurniModel.const_40);
                  break;
               case "tab_wall":
                  this.var_62.switchCategory(FurniModel.const_44);
            }
            this.selectPetsTab();
         }
      }
      
      private function selectPetsTab() : void
      {
         if(this._view == null)
         {
            return;
         }
         var _loc1_:ISelectorWindow = this._view.findChildByName("category_selector") as ISelectorWindow;
         if(_loc1_ != null)
         {
            _loc1_.setSelected(_loc1_.getSelectableByName("tab_pets"));
         }
      }
      
      public function setSelectedGridItem(param1:PetsGridItem) : void
      {
         if(this.var_325 != null)
         {
            this.var_325.setSelected(false);
         }
         this.var_325 = param1;
         if(this.var_325 != null)
         {
            this.var_325.setSelected(true);
         }
         this.updatePreview(param1);
      }
      
      public function setViewToState() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Map = this.var_62.pets;
         if(!this.var_62.isListInited())
         {
            _loc2_ = this.const_861;
         }
         else if(!_loc1_ || _loc1_.length == 0)
         {
            _loc2_ = this.const_1568;
         }
         else
         {
            _loc2_ = this.const_1567;
         }
         if(this.var_2368 == _loc2_)
         {
            return;
         }
         this.var_2368 = _loc2_;
         var _loc3_:IWindowContainer = this._view.findChildByName("loading_container") as IWindowContainer;
         var _loc4_:IWindowContainer = this._view.findChildByName("empty_container") as IWindowContainer;
         var _loc5_:IWindowContainer = this._view.findChildByName("grid_container") as IWindowContainer;
         var _loc6_:IWindowContainer = this._view.findChildByName("preview_container") as IWindowContainer;
         switch(_loc2_)
         {
            case this.const_861:
               _loc3_.visible = true;
               _loc4_.visible = false;
               _loc5_.visible = false;
               _loc6_.visible = false;
               break;
            case this.const_1568:
               _loc3_.visible = false;
               _loc4_.visible = true;
               _loc5_.visible = false;
               _loc6_.visible = false;
               break;
            case this.const_1567:
               _loc3_.visible = false;
               _loc4_.visible = false;
               _loc5_.visible = true;
               _loc6_.visible = true;
               this.updateGrid();
               this.updatePreview();
         }
      }
      
      private function updatePreview(param1:PetsGridItem = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         if(this._view == null)
         {
            return;
         }
         if(param1 == null || param1.pet == null)
         {
            _loc2_ = new BitmapData(1,1);
            _loc3_ = "";
            _loc4_ = "";
            _loc5_ = false;
         }
         else
         {
            _loc12_ = param1.pet;
            _loc13_ = this._avatarRenderer.createPetImageFromFigure(_loc12_.figure,AvatarScaleType.const_49,this);
            if(_loc13_ == null)
            {
               return;
            }
            _loc13_.setDirection(AvatarSetType.const_32,4);
            _loc2_ = _loc13_.getCroppedImage(AvatarSetType.const_32);
            _loc3_ = _loc12_.name;
            _loc14_ = _loc13_.petBreed;
            if(_loc14_ < 10)
            {
               _loc4_ = "${pet.race." + _loc13_.petType + ".00" + _loc14_ + "}";
            }
            else if(_loc14_ < 100)
            {
               _loc4_ = "${pet.race." + _loc13_.petType + ".0" + _loc14_ + "}";
            }
            _loc13_.dispose();
            _loc5_ = true;
         }
         var _loc6_:IBitmapWrapperWindow = this._view.findChildByName("preview_image") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc15_ = new BitmapData(_loc6_.width,_loc6_.height);
            _loc15_.fillRect(_loc15_.rect,0);
            _loc15_.copyPixels(_loc2_,_loc2_.rect,new Point(_loc15_.width / 2 - _loc2_.width / 2,_loc15_.height / 2 - _loc2_.height / 2));
            _loc6_.bitmap = _loc15_;
         }
         var _loc7_:ITextWindow = this._view.findChildByName("preview_text") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc3_;
         }
         _loc7_ = this._view.findChildByName("preview_description") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc4_;
         }
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(this.var_62.roomSession != null)
         {
            _loc8_ = this.var_62.roomSession.arePetsAllowed;
            _loc9_ = this.var_62.roomSession.isRoomOwner;
         }
         var _loc10_:String = "";
         if(!_loc9_)
         {
            if(_loc8_)
            {
               _loc10_ = "${inventory.pets.allowed}";
            }
            else
            {
               _loc10_ = "${inventory.pets.forbidden}";
            }
         }
         _loc7_ = this._view.findChildByName("preview_info") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc10_;
         }
         var _loc11_:IButtonWindow = this._view.findChildByName("place_button") as IButtonWindow;
         if(_loc11_ != null)
         {
            if(_loc5_ && (_loc9_ || _loc8_))
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
         }
      }
      
      public function petImageReady(param1:String) : void
      {
         this.update();
      }
   }
}
