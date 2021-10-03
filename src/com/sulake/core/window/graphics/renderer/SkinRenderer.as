package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import flash.display.IBitmapDrawable;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class SkinRenderer implements ISkinRenderer
   {
       
      
      private var _name:String;
      
      private var _disposed:Boolean = false;
      
      protected var var_354:Dictionary;
      
      protected var _templatesByState:Dictionary;
      
      protected var var_516:Dictionary;
      
      protected var var_420:Dictionary;
      
      public function SkinRenderer(param1:String)
      {
         super();
         this._name = param1;
         this.var_354 = new Dictionary();
         this._templatesByState = new Dictionary();
         this.var_516 = new Dictionary();
         this.var_420 = new Dictionary();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function parse(param1:IAsset, param2:XMLList, param3:IAssetLibrary) : void
      {
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this._disposed)
         {
            for(_loc1_ in this.var_516)
            {
               ISkinLayout(this.var_516[_loc1_]).dispose();
               delete this.var_516[_loc1_];
            }
            this.var_516 = null;
            this.var_420 = null;
            for(_loc1_ in this.var_354)
            {
               ISkinTemplate(this.var_354[_loc1_]).dispose();
               delete this.var_354[_loc1_];
            }
            this.var_354 = null;
            this._templatesByState = null;
         }
      }
      
      public function draw(param1:IWindow, param2:IBitmapDrawable, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
      }
      
      public function isStateDrawable(param1:uint) : Boolean
      {
         return false;
      }
      
      public function getLayoutByState(param1:uint) : ISkinLayout
      {
         return this.var_420[param1];
      }
      
      public function registerLayoutForRenderState(param1:uint, param2:String) : void
      {
         var _loc3_:ISkinLayout = this.var_516[param2];
         if(_loc3_ == null)
         {
            throw new Error("Layout \"" + param2 + "\" not found in renderer!");
         }
         this.var_420[param1] = _loc3_;
      }
      
      public function removeLayoutFromRenderState(param1:uint) : void
      {
         delete this.var_420[param1];
      }
      
      public function hasLayoutForState(param1:uint) : Boolean
      {
         return this.var_420[param1] != null;
      }
      
      public function getTemplateByState(param1:uint) : ISkinTemplate
      {
         return this._templatesByState[param1];
      }
      
      public function registerTemplateForRenderState(param1:uint, param2:String) : void
      {
         var _loc3_:ISkinTemplate = this.var_354[param2];
         if(_loc3_ == null)
         {
            throw new Error("Template \"" + param2 + "\" not found in renderer!");
         }
         this._templatesByState[param1] = _loc3_;
      }
      
      public function removeTemplateFromRenderState(param1:uint) : void
      {
         delete this._templatesByState[param1];
      }
      
      public function hasTemplateForState(param1:uint) : Boolean
      {
         return this._templatesByState[param1] != null;
      }
      
      public function addLayout(param1:ISkinLayout) : ISkinLayout
      {
         this.var_516[param1.name] = param1;
         return param1;
      }
      
      public function getLayoutByName(param1:String) : ISkinLayout
      {
         return this.var_516[param1];
      }
      
      public function removeLayout(param1:ISkinLayout) : ISkinLayout
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         param1 = this.var_354[param1.name];
         if(param1 != null)
         {
            for(_loc2_ in this.var_420)
            {
               _loc3_ = uint(_loc2_ as uint);
               if(this.var_420[_loc3_] == param1)
               {
                  this.removeLayoutFromRenderState(_loc3_);
               }
            }
            delete this.var_516[param1.name];
         }
         return param1;
      }
      
      public function addTemplate(param1:ISkinTemplate) : ISkinTemplate
      {
         this.var_354[param1.name] = param1;
         return param1;
      }
      
      public function getTemplateByName(param1:String) : ISkinTemplate
      {
         return this.var_354[param1];
      }
      
      public function removeTemplate(param1:ISkinTemplate) : ISkinTemplate
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         param1 = this.var_354[param1.name];
         if(param1 != null)
         {
            for(_loc2_ in this._templatesByState)
            {
               _loc3_ = uint(_loc2_ as uint);
               if(this._templatesByState[_loc3_] == param1)
               {
                  this.removeTemplateFromRenderState(_loc3_);
               }
            }
            delete this.var_354[param1.name];
         }
         return param1;
      }
   }
}
