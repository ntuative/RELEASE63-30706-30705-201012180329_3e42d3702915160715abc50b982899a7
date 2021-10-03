package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PetsGridItem
   {
       
      
      private var var_1359:PetData;
      
      private var _window:IWindowContainer;
      
      private var _isSelected:Boolean;
      
      private var var_1386:PetsView;
      
      private var var_1385:Boolean;
      
      private const const_1818:int = 8947848;
      
      private const const_1819:int = 13421772;
      
      public function PetsGridItem(param1:PetsView, param2:PetData, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IAvatarRenderManager)
      {
         super();
         if(param1 == null || param2 == null || param3 == null || param4 == null || param5 == null)
         {
            return;
         }
         this.var_1386 = param1;
         this.var_1359 = param2;
         var _loc6_:XmlAsset = param4.getAssetByName("inventory_thumb_xml") as XmlAsset;
         if(_loc6_ == null || _loc6_.content == null)
         {
            return;
         }
         this._window = param3.buildFromXML(_loc6_.content as XML) as IWindowContainer;
         this._window.procedure = this.eventHandler;
         var _loc7_:IAvatarImage = param5.createPetImageFromFigure(param2.figure,AvatarScaleType.const_49);
         if(_loc7_ == null)
         {
            return;
         }
         _loc7_.setDirection(AvatarSetType.const_32,3);
         var _loc8_:BitmapData = _loc7_.getCroppedImage(AvatarSetType.const_42);
         var _loc9_:IBitmapWrapperWindow = this._window.findChildByName("bitmap") as IBitmapWrapperWindow;
         _loc7_.dispose();
         var _loc10_:BitmapData = new BitmapData(_loc9_.width,_loc9_.height);
         _loc10_.fillRect(_loc10_.rect,0);
         _loc10_.copyPixels(_loc8_,_loc8_.rect,new Point(_loc10_.width / 2 - _loc8_.width / 2,_loc10_.height / 2 - _loc8_.height / 2));
         _loc9_.bitmap = _loc10_;
         this.setSelected(false);
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.const_39:
               this.var_1386.setSelectedGridItem(this);
               this.var_1385 = true;
               break;
            case WindowMouseEvent.const_54:
               this.var_1385 = false;
               break;
            case WindowMouseEvent.const_25:
               if(this.var_1385)
               {
                  this.var_1385 = false;
                  this.var_1386.placePetToRoom(this.var_1359.id,true);
               }
         }
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(this._isSelected == param1)
         {
            return;
         }
         this._isSelected = param1;
         if(this._window == null)
         {
            return;
         }
         this._window.color = !!this._isSelected ? uint(this.const_1818) : uint(this.const_1819);
      }
      
      public function dispose() : void
      {
         this.var_1386 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get pet() : PetData
      {
         return this.var_1359;
      }
   }
}
