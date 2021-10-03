package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_405:uint = 0;
      
      public static const const_1448:uint = 1;
      
      public static const const_1633:int = 0;
      
      public static const const_1596:int = 1;
      
      public static const const_1672:int = 2;
      
      public static const const_1616:int = 3;
      
      public static const const_1293:int = 4;
      
      public static const const_357:int = 5;
      
      public static var var_1422:IMouseCursor;
      
      public static var var_349:IEventQueue;
      
      private static var var_595:IEventProcessor;
      
      private static var var_1742:uint = const_405;
      
      private static var stage:Stage;
      
      private static var var_149:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_2434:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_173:DisplayObjectContainer;
      
      protected var var_2688:Boolean = true;
      
      protected var var_1180:Error;
      
      protected var var_1906:int = -1;
      
      protected var var_1179:IInternalWindowServices;
      
      protected var var_1428:IWindowParser;
      
      protected var var_2641:IWindowFactory;
      
      protected var var_130:IDesktopWindow;
      
      protected var var_1429:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_508:Boolean = false;
      
      private var var_2435:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_149 = param2;
         this._localization = param4;
         this.var_173 = param5;
         this.var_1179 = new ServiceManager(this,param5);
         this.var_2641 = param3;
         this.var_1428 = new WindowParser(this);
         this.var_2434 = param7;
         if(!stage)
         {
            if(this.var_173 is Stage)
            {
               stage = this.var_173 as Stage;
            }
            else if(this.var_173.stage)
            {
               stage = this.var_173.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_130 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_173.addChild(this.var_130.getDisplayObject());
         this.var_173.doubleClickEnabled = true;
         this.var_173.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_149,this.var_130,this.var_130,null,this.var_2434);
         inputMode = const_405;
         this.var_1429 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1742;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_349)
         {
            if(var_349 is IDisposable)
            {
               IDisposable(var_349).dispose();
            }
         }
         if(var_595)
         {
            if(var_595 is IDisposable)
            {
               IDisposable(var_595).dispose();
            }
         }
         switch(value)
         {
            case const_405:
               var_349 = new MouseEventQueue(stage);
               var_595 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1448:
               var_349 = new TabletEventQueue(stage);
               var_595 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_405;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_173.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_173.removeChild(IGraphicContextHost(this.var_130).getGraphicContext(true) as DisplayObject);
            this.var_130.destroy();
            this.var_130 = null;
            this.var_1429.destroy();
            this.var_1429 = null;
            if(this.var_1179 is IDisposable)
            {
               IDisposable(this.var_1179).dispose();
            }
            this.var_1179 = null;
            this.var_1428.dispose();
            this.var_1428 = null;
            var_149 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1180;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1906;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1180 = param2;
         this.var_1906 = param1;
         if(this.var_2688)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1180 = null;
         this.var_1906 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1179;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1428;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2641;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_130;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1422 == null)
         {
            var_1422 = new MouseCursorControl(this.var_173);
         }
         return var_1422;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_130.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = Classes.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            this.handleError(WindowContext.const_1293,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1429;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_130,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_130)
         {
            this.var_130 = null;
         }
         if(param1.state != WindowState.const_443)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_149.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_508 = true;
         if(this.var_1180)
         {
            throw this.var_1180;
         }
         var_595.process(this._eventProcessorState,var_349);
         this.var_508 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2435 = true;
         var_149.update(param1);
         this.var_2435 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_130 != null && !this.var_130.disposed)
         {
            if(this.var_173 is Stage)
            {
               this.var_130.width = Stage(this.var_173).stageWidth;
               this.var_130.height = Stage(this.var_173).stageHeight;
            }
            else
            {
               this.var_130.width = this.var_173.width;
               this.var_130.height = this.var_173.height;
            }
         }
      }
   }
}
