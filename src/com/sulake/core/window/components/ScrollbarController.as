package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.events.WindowTouchEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ScrollbarController extends InteractiveController implements IScrollbarWindow, ITouchAwareWindow
   {
      
      private static const const_1138:String = "increment";
      
      private static const const_1139:String = "decrement";
      
      private static const const_825:String = "slider_track";
      
      private static const const_542:String = "slider_bar";
       
      
      protected var _offset:Number = 0;
      
      protected var var_623:Number = 0.1;
      
      protected var var_19:IScrollableWindow;
      
      private var _horizontal:Boolean;
      
      private var var_788:String;
      
      private var var_958:Boolean = false;
      
      public function ScrollbarController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0, param12:IScrollableWindow = null)
      {
         var _loc14_:* = null;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_151 = false;
         this.var_19 = param12;
         this._horizontal = param2 == WindowType.const_513;
         var _loc13_:Array = new Array();
         groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc13_,true);
         for each(_loc14_ in _loc13_)
         {
            _loc14_.procedure = this.scrollButtonEventProc;
         }
         this.updateLiftSizeAndPosition();
      }
      
      public function get scrollH() : Number
      {
         return !!this._horizontal ? Number(this._offset) : Number(0);
      }
      
      public function get scrollV() : Number
      {
         return !!this._horizontal ? 0 : Number(this._offset);
      }
      
      public function get scrollable() : IScrollableWindow
      {
         return this.var_19;
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(this._horizontal)
         {
            if(this.setScrollPosition(param1))
            {
               this.updateLiftSizeAndPosition();
            }
         }
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(!this._horizontal)
         {
            if(this.setScrollPosition(param1))
            {
               this.updateLiftSizeAndPosition();
            }
         }
      }
      
      public function set scrollable(param1:IScrollableWindow) : void
      {
         if(this.var_19 != null && !this.var_19.disposed)
         {
            this.var_19.removeEventListener(WindowEvent.const_45,this.onScrollableResized);
            this.var_19.removeEventListener(WindowEvent.const_486,this.onScrollableScrolled);
         }
         this.var_19 = param1;
         if(this.var_19 != null && !this.var_19.disposed)
         {
            this.var_19.addEventListener(WindowEvent.const_45,this.onScrollableResized);
            this.var_19.addEventListener(WindowEvent.const_486,this.onScrollableScrolled);
            this.updateLiftSizeAndPosition();
         }
      }
      
      public function get horizontal() : Boolean
      {
         return this._horizontal;
      }
      
      public function get vertical() : Boolean
      {
         return !this._horizontal;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:String = "";
         if(this.var_19 is IWindow)
         {
            _loc2_ = IWindow(this.var_19).name;
         }
         else if(this.var_788 != null)
         {
            _loc2_ = this.var_788;
         }
         _loc1_.push(new PropertyStruct("scrollable",_loc2_,"String",_loc2_ != ""));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_] as PropertyStruct;
            if(_loc3_.key == "scrollable")
            {
               this.var_788 = _loc3_.value as String;
            }
            _loc4_++;
         }
         super.properties = param1;
      }
      
      protected function get track() : WindowController
      {
         return findChildByName(const_825) as WindowController;
      }
      
      protected function get lift() : WindowController
      {
         return this.track.findChildByName(const_542) as WindowController;
      }
      
      override public function dispose() : void
      {
         this.scrollable = null;
         super.dispose();
      }
      
      override public function enable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(super.enable())
         {
            _loc1_ = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc1_,true);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               IWindow(_loc1_[_loc2_]).enable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      override public function disable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(super.disable())
         {
            _loc1_ = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc1_,true);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               IWindow(_loc1_[_loc2_]).disable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      protected function setScrollPosition(param1:Number) : Boolean
      {
         var _loc2_:* = false;
         if(this.var_19 == null)
         {
            if(!this.resolveScrollTarget())
            {
               return false;
            }
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         this._offset = param1;
         if(this._horizontal)
         {
            _loc2_ = this.var_19.scrollH != this._offset;
            this.var_19.scrollH = this._offset;
         }
         else
         {
            _loc2_ = this.var_19.scrollV != this._offset;
            this.var_19.scrollV = this._offset;
         }
         return _loc2_;
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         switch(param1.name)
         {
            case ScrollbarController.const_542:
               if(param2.type == WindowNotifyEvent.const_259)
               {
                  if(!this.var_958)
                  {
                     if(this._horizontal)
                     {
                        this.setScrollPosition(ScrollbarLiftController(param1).offsetX);
                     }
                     else
                     {
                        this.setScrollPosition(ScrollbarLiftController(param1).offsetY);
                     }
                  }
               }
         }
         var _loc3_:Boolean = super.update(param1,param2);
         if(param2.type == WindowNotifyEvent.const_481)
         {
            if(this.var_19 == null)
            {
               this.resolveScrollTarget();
            }
         }
         if(param1 == this)
         {
            if(param2.type == WindowNotifyEvent.const_175)
            {
               this.updateLiftSizeAndPosition();
            }
            else if(param2.type == WindowMouseEvent.const_304)
            {
               if(WindowMouseEvent(param2).delta > 0)
               {
                  if(this._horizontal)
                  {
                     this.scrollH -= this.var_623;
                  }
                  else
                  {
                     this.scrollV -= this.var_623;
                  }
               }
               else if(this._horizontal)
               {
                  this.scrollH += this.var_623;
               }
               else
               {
                  this.scrollV += this.var_623;
               }
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      private function updateLiftSizeAndPosition() : void
      {
         var _loc1_:* = NaN;
         var _loc4_:int = 0;
         if(this.var_19 == null || this.var_19.disposed)
         {
            if(_disposed || !this.resolveScrollTarget())
            {
               return;
            }
         }
         var _loc2_:WindowController = this.track;
         var _loc3_:WindowController = this.lift;
         if(_loc3_ != null)
         {
            if(this._horizontal)
            {
               _loc1_ = Number(this.var_19.visibleRegion.width / this.var_19.scrollableRegion.width);
               if(_loc1_ > 1)
               {
                  _loc1_ = 1;
               }
               _loc4_ = _loc1_ * _loc2_.width;
               _loc3_.width = _loc4_;
               _loc3_.x = this.var_19.scrollH * (_loc2_.width - _loc4_);
            }
            else
            {
               _loc1_ = Number(this.var_19.visibleRegion.height / this.var_19.scrollableRegion.height);
               if(_loc1_ > 1)
               {
                  _loc1_ = 1;
               }
               _loc4_ = _loc1_ * _loc2_.height;
               _loc3_.height = _loc4_;
               _loc3_.y = this.var_19.scrollV * (_loc2_.height - _loc3_.height);
            }
         }
         if(_loc1_ == 1)
         {
            this.disable();
         }
         else
         {
            this.enable();
         }
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      private function scrollButtonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.const_39 || param1.type == WindowTouchEvent.const_500)
         {
            if(param2.name == const_1138)
            {
               if(this.var_19)
               {
                  this.var_958 = true;
                  if(this._horizontal)
                  {
                     this.scrollH += this.var_19.scrollStepH / this.var_19.maxScrollH;
                  }
                  else
                  {
                     this.scrollV += this.var_19.scrollStepV / this.var_19.maxScrollV;
                  }
                  this.var_958 = false;
               }
            }
            else if(param2.name == const_1139)
            {
               if(this.var_19)
               {
                  this.var_958 = true;
                  if(this._horizontal)
                  {
                     this.scrollH -= this.var_19.scrollStepH / this.var_19.maxScrollH;
                  }
                  else
                  {
                     this.scrollV -= this.var_19.scrollStepV / this.var_19.maxScrollV;
                  }
                  this.var_958 = false;
               }
            }
            else if(param2.name == const_825)
            {
               if(param1 is WindowMouseEvent)
               {
                  _loc4_ = WindowMouseEvent(param1).localX;
                  _loc5_ = WindowMouseEvent(param1).localY;
               }
               else if(param1 is WindowTouchEvent)
               {
                  _loc4_ = WindowTouchEvent(param1).localX;
                  _loc5_ = WindowTouchEvent(param1).localY;
               }
               _loc6_ = WindowController(param2).getChildByName(ScrollbarController.const_542).rectangle;
               if(this._horizontal)
               {
                  if(_loc4_ < _loc6_.x)
                  {
                     this.scrollH -= (this.var_19.visibleRegion.width - this.var_19.scrollStepH) / this.var_19.maxScrollH;
                  }
                  else if(_loc4_ > _loc6_.right)
                  {
                     this.scrollH += (this.var_19.visibleRegion.width - this.var_19.scrollStepH) / this.var_19.maxScrollH;
                  }
               }
               else if(_loc5_ < _loc6_.y)
               {
                  this.scrollV -= (this.var_19.visibleRegion.height - this.var_19.scrollStepV) / this.var_19.maxScrollV;
               }
               else if(_loc5_ > _loc6_.bottom)
               {
                  this.scrollV += (this.var_19.visibleRegion.height - this.var_19.scrollStepV) / this.var_19.maxScrollV;
               }
               _loc3_ = true;
            }
         }
         if(param1.type == WindowMouseEvent.const_304)
         {
            if(WindowMouseEvent(param1).delta > 0)
            {
               if(this._horizontal)
               {
                  this.scrollH -= this.var_623;
               }
               else
               {
                  this.scrollV -= this.var_623;
               }
            }
            else if(this._horizontal)
            {
               this.scrollH += this.var_623;
            }
            else
            {
               this.scrollV += this.var_623;
            }
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this.updateLiftSizeAndPosition();
         }
      }
      
      private function resolveScrollTarget() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_19 != null)
         {
            if(!this.var_19.disposed)
            {
               return true;
            }
         }
         if(this.var_788 != null)
         {
            _loc1_ = findParentByName(this.var_788) as IScrollableWindow;
            if(_loc1_ == null && var_13 is IWindowContainer)
            {
               _loc1_ = IWindowContainer(var_13).findChildByName(this.var_788) as IScrollableWindow;
               if(_loc1_)
               {
                  this.scrollable = _loc1_;
                  return true;
               }
            }
         }
         if(var_13 is IScrollableWindow)
         {
            this.scrollable = IScrollableWindow(var_13);
            return true;
         }
         if(var_13 is IWindowContainer && !(var_13 is IDesktopWindow))
         {
            _loc2_ = uint(IWindowContainer(var_13).numChildren);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = IWindowContainer(var_13).getChildAt(_loc4_) as IScrollableWindow;
               if(_loc3_)
               {
                  this.scrollable = _loc3_;
                  return true;
               }
               _loc4_++;
            }
         }
         return false;
      }
      
      private function onScrollableResized(param1:Event) : void
      {
         this.updateLiftSizeAndPosition();
         this.setScrollPosition(this._offset);
      }
      
      private function onScrollableScrolled(param1:WindowEvent) : void
      {
         this.updateLiftSizeAndPosition();
      }
   }
}
