package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.help.INameChangeUI;
   import flash.geom.Rectangle;
   
   public class NameSuggestionListRenderer
   {
       
      
      private const const_1816:int = 5;
      
      private const const_1815:int = 5;
      
      private var var_45:INameChangeUI;
      
      private var _offsetX:int;
      
      private var var_953:int;
      
      private var var_952:Rectangle = null;
      
      private var var_2646:int = 0;
      
      public function NameSuggestionListRenderer(param1:INameChangeUI)
      {
         super();
         this.var_45 = param1;
      }
      
      public function dispose() : void
      {
         this.var_45 = null;
      }
      
      public function render(param1:Array, param2:IWindowContainer) : int
      {
         var _loc3_:* = null;
         while(param2.removeChildAt(0) != null)
         {
         }
         this.var_2646 = 0;
         this._offsetX = 0;
         this.var_953 = 0;
         this.var_952 = param2.rectangle.clone();
         this.var_952.height = 150;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = this.createItem(param1[_loc4_] as String);
            if(this.fit(_loc3_.rectangle))
            {
               param2.addChild(_loc3_);
            }
            else
            {
               _loc3_.dispose();
            }
            _loc4_++;
         }
         var _loc5_:int = param2.numChildren;
         if(_loc5_ == 0)
         {
            return 0;
         }
         var _loc6_:IWindow = param2.getChildAt(param2.numChildren - 1);
         return _loc6_.rectangle.bottom;
      }
      
      private function fit(param1:Rectangle) : Boolean
      {
         if(param1.width > this.var_952.width)
         {
            return false;
         }
         if(this.var_953 + param1.height > this.var_952.height)
         {
            return false;
         }
         if(this._offsetX + param1.width > this.var_952.width)
         {
            this._offsetX = 0;
            this.var_953 += param1.height + this.const_1815;
            return this.fit(param1);
         }
         param1.offset(this._offsetX,this.var_953);
         this._offsetX += param1.width + this.const_1816;
         return true;
      }
      
      private function createItem(param1:String) : ITextWindow
      {
         var _loc2_:ITextWindow = this.var_45.buildXmlWindow("tutorial_name_suggestion_item") as ITextWindow;
         if(_loc2_ == null)
         {
            return null;
         }
         _loc2_.text = param1;
         return _loc2_;
      }
   }
}
