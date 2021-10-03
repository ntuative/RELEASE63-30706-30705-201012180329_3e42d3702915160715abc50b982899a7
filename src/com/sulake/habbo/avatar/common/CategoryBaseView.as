package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.avatar.AvatarEditorView;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class CategoryBaseView
   {
       
      
      protected var _windowManager:IHabboWindowManager;
      
      protected var _assetLibrary:IAssetLibrary;
      
      protected var _window:IWindowContainer;
      
      protected var var_34:Dictionary;
      
      protected var var_129:String = "";
      
      protected var var_40:String = "";
      
      protected var var_62:IAvatarEditorCategoryModel;
      
      protected var var_172:Boolean;
      
      public function CategoryBaseView(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IAvatarEditorCategoryModel)
      {
         super();
         this._assetLibrary = param2;
         this._windowManager = param1;
         this.var_62 = param3;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_34)
         {
            for each(_loc1_ in this.var_34)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            this.var_34 = null;
         }
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         this._assetLibrary = null;
         this._windowManager = null;
         this.var_62 = null;
         this.var_172 = false;
      }
      
      public function init() : void
      {
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_34)
         {
            _loc1_.dispose();
         }
         this.var_34 = null;
         this.var_129 = "";
         this.var_40 = "";
         this.var_172 = false;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!this.var_172)
         {
            this.init();
         }
         return this._window;
      }
      
      public function showPalettes(param1:String, param2:int) : void
      {
         if(!this.var_34)
         {
            return;
         }
         if(!this.var_172)
         {
            this.init();
         }
         var _loc3_:AvatarEditorGridView = this.var_34[param1] as AvatarEditorGridView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.showPalettes(param2);
      }
      
      protected function setElementImage(param1:IBitmapWrapperWindow, param2:Boolean) : void
      {
         var asset:IAsset = null;
         var assetName:String = null;
         var src:BitmapData = null;
         var dx:int = 0;
         var dy:int = 0;
         var bmpWindow:IBitmapWrapperWindow = param1;
         var active:Boolean = param2;
         if(!this._assetLibrary)
         {
            return;
         }
         if(bmpWindow == null)
         {
            return;
         }
         var result:Array = bmpWindow.properties.filter(function(param1:*, param2:int, param3:Array):Boolean
         {
            return PropertyStruct(param1).key == "bitmap_asset_name";
         });
         if(result && result.length)
         {
            assetName = PropertyStruct(result[0]).value as String;
            if(active)
            {
               assetName = assetName.replace("_on","");
            }
            asset = this._assetLibrary.getAssetByName(assetName);
            if(asset && asset is BitmapDataAsset)
            {
               bmpWindow.bitmap = new BitmapData(bmpWindow.width,bmpWindow.height,false,AvatarEditorView.var_1881);
               src = BitmapDataAsset(asset).content as BitmapData;
               dx = (bmpWindow.width - src.width) / 2;
               dy = (bmpWindow.height - src.height) / 2;
               bmpWindow.bitmap.copyPixels(src,src.rect,new Point(dx,dy));
            }
         }
      }
      
      protected function updateGridView() : void
      {
         var _loc1_:IWindowContainer = this._window.findChildByName("grid_container") as IWindowContainer;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeChildAt(0);
         var _loc2_:AvatarEditorGridView = this.var_34[this.var_129];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.window;
         if(_loc3_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.addChild(_loc3_);
         _loc1_.invalidate();
         if(_loc2_.firstView)
         {
            _loc2_.initFromList();
         }
      }
      
      protected function activateTab(param1:String) : void
      {
         if(!this._window)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         this.setElementImage(_loc2_,true);
      }
      
      protected function inactivateTab(param1:String) : void
      {
         if(!this._window)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         this.setElementImage(_loc2_,false);
      }
      
      protected function attachImages() : void
      {
         var _loc2_:* = null;
         if(!this._window)
         {
            return;
         }
         var _loc1_:Array = new Array();
         this._window.groupChildrenWithTag("bitmap",_loc1_,true);
         for each(_loc2_ in _loc1_)
         {
            this.setElementImage(_loc2_,false);
         }
      }
   }
}
