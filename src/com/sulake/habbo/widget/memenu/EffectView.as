package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class EffectView
   {
       
      
      private var _container:MeMenuEffectsView;
      
      private var _window:IWindowContainer;
      
      private var var_158:IWidgetAvatarEffect;
      
      private var var_832:IWindow;
      
      private var var_425:Number;
      
      private var var_833:ITextWindow;
      
      private var var_182:Timer;
      
      private var var_834:IWindow;
      
      public function EffectView()
      {
         super();
         this.var_182 = new Timer(1000);
         this.var_182.addEventListener(TimerEvent.TIMER,this.onUpdate);
      }
      
      public function get effect() : IWidgetAvatarEffect
      {
         return this.var_158;
      }
      
      public function init(param1:MeMenuEffectsView, param2:String, param3:IWidgetAvatarEffect) : void
      {
         this.var_158 = param3;
         this._container = param1;
         this.createWindow(param2);
      }
      
      public function dispose() : void
      {
         if(this.var_182 != null)
         {
            this.var_182.stop();
            this.var_182.removeEventListener(TimerEvent.TIMER,this.onUpdate);
            this.var_182 = null;
         }
         this._container = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_832 != null)
         {
            if(this.var_158.isActive)
            {
               _loc2_ = this.var_158.secondsLeft / Number(this.var_158.duration);
               this.var_832.width = _loc2_ * this.var_425;
            }
            else
            {
               this.var_832.width = 0;
               this.var_182.stop();
            }
            this.setTimeLeft();
         }
         else
         {
            this.var_182.stop();
         }
      }
      
      private function setTimeLeft() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this.var_833 != null)
         {
            this.var_833.caption = "${widgets.memenu.effects.active.timeleft}";
            _loc1_ = this.var_833.text;
            if(this.var_158.isActive)
            {
               _loc2_ = this.var_158.secondsLeft;
               _loc3_ = Math.floor(_loc2_ / 3600);
               _loc4_ = Math.floor(_loc2_ / 60) % 60;
               _loc5_ = _loc2_ % 60;
               _loc6_ = _loc3_ < 10 ? "0" : "";
               _loc7_ = _loc4_ < 10 ? "0" : "";
               _loc8_ = _loc5_ < 10 ? "0" : "";
               _loc9_ = _loc6_ + _loc3_ + ":" + _loc7_ + _loc4_ + ":" + _loc8_ + _loc5_;
               _loc1_ = _loc1_.replace("%time_left%",_loc9_);
               this.var_833.text = _loc1_;
            }
            else
            {
               this.var_833.caption = "${widgets.memenu.effects.activate}";
            }
         }
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc3_:String = "";
         if(this.var_158.isInUse)
         {
            _loc3_ = "memenu_effect_selected";
         }
         else if(this.var_158.isActive)
         {
            _loc3_ = "memenu_effect_unselected";
         }
         else
         {
            _loc3_ = "memenu_effect_inactive";
         }
         Logger.log("Me Menu Active Effect View: " + _loc3_);
         _loc2_ = this._container.widget.assets.getAssetByName(_loc3_) as XmlAsset;
         this._window = (this._container.widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this._window.name = param1;
         this._container.effectsContainer.addChild(this._window);
         var _loc4_:ITextWindow = this._window.findChildByName("effect_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.caption = "${fx_" + this.var_158.type + "}";
         }
         var _loc5_:ITextWindow = this._window.findChildByName("effect_amount") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.caption = this.var_158.effectsInInventory + "";
         }
         var _loc6_:IWindowContainer = this._window.findChildByName("effect_amount_bg1") as IWindowContainer;
         if(this.var_158.effectsInInventory < 2)
         {
            if(_loc6_ != null)
            {
               _loc6_.visible = false;
            }
         }
         if(_loc3_ == "memenu_effect_inactive")
         {
            _loc7_ = this._window.findChildByName("activate_effect") as IButtonWindow;
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            }
         }
         else
         {
            this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            if(this.var_158.isActive)
            {
               this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseEvent);
               this._window.addEventListener(WindowMouseEvent.const_25,this.onMouseEvent);
            }
            if(this.var_158.isInUse)
            {
               this.setElementImage("effect_hilite","memenu_fx_pause");
            }
            else
            {
               this.setElementImage("effect_hilite","memenu_fx_play");
            }
            this.var_834 = this._window.findChildByName("effect_hilite");
            this.var_834.visible = false;
         }
         this.var_833 = this._window.findChildByName("time_left") as ITextWindow;
         this.setTimeLeft();
         this.var_832 = this._window.findChildByName("loader_bar");
         if(this.var_832 != null)
         {
            this.var_425 = this.var_832.width;
            this.var_182.start();
            this.onUpdate();
         }
         if(this.var_158.icon)
         {
            this.setElementBitmap("effect_icon",this.var_158.icon);
         }
      }
      
      private function setElementBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
         else
         {
            Logger.log("Could not find element: " + param1);
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(this.var_834 != null)
               {
                  this.var_834.visible = true;
               }
               break;
            case WindowMouseEvent.const_25:
               if(this.var_834 != null)
               {
                  this.var_834.visible = false;
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               this._container.selectEffect(this);
         }
      }
      
      private function setElementImage(param1:String, param2:String) : void
      {
         var _loc3_:BitmapDataAsset = this._container.widget.assets.getAssetByName(param2) as BitmapDataAsset;
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         this.setElementBitmap(param1,_loc4_);
      }
   }
}
