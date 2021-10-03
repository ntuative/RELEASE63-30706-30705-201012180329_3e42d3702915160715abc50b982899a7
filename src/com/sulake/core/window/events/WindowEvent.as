package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1290:String = "WE_CREATE";
      
      public static const const_1313:String = "WE_CREATED";
      
      public static const const_1408:String = "WE_DESTROY";
      
      public static const const_288:String = "WE_DESTROYED";
      
      public static const const_1272:String = "WE_OPEN";
      
      public static const const_1278:String = "WE_OPENED";
      
      public static const const_1328:String = "WE_CLOSE";
      
      public static const const_1323:String = "WE_CLOSED";
      
      public static const const_1368:String = "WE_FOCUS";
      
      public static const const_173:String = "WE_FOCUSED";
      
      public static const const_1373:String = "WE_UNFOCUS";
      
      public static const const_1432:String = "WE_UNFOCUSED";
      
      public static const const_1433:String = "WE_ACTIVATE";
      
      public static const const_1418:String = "WE_ACTIVATED";
      
      public static const const_1342:String = "WE_DEACTIVATE";
      
      public static const const_1039:String = "WE_DEACTIVATED";
      
      public static const const_539:String = "WE_SELECT";
      
      public static const const_60:String = "WE_SELECTED";
      
      public static const const_613:String = "WE_UNSELECT";
      
      public static const const_748:String = "WE_UNSELECTED";
      
      public static const const_1613:String = "WE_ATTACH";
      
      public static const const_1664:String = "WE_ATTACHED";
      
      public static const const_1641:String = "WE_DETACH";
      
      public static const const_1611:String = "WE_DETACHED";
      
      public static const const_1360:String = "WE_LOCK";
      
      public static const const_1314:String = "WE_LOCKED";
      
      public static const const_1356:String = "WE_UNLOCK";
      
      public static const const_1496:String = "WE_UNLOCKED";
      
      public static const const_806:String = "WE_ENABLE";
      
      public static const const_286:String = "WE_ENABLED";
      
      public static const const_562:String = "WE_DISABLE";
      
      public static const const_253:String = "WE_DISABLED";
      
      public static const const_1461:String = "WE_RELOCATE";
      
      public static const const_344:String = "WE_RELOCATED";
      
      public static const const_1420:String = "WE_RESIZE";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1423:String = "WE_MINIMIZE";
      
      public static const const_1456:String = "WE_MINIMIZED";
      
      public static const const_1275:String = "WE_MAXIMIZE";
      
      public static const const_1500:String = "WE_MAXIMIZED";
      
      public static const const_1398:String = "WE_RESTORE";
      
      public static const const_1372:String = "WE_RESTORED";
      
      public static const const_1717:String = "WE_ARRANGE";
      
      public static const const_1798:String = "WE_ARRANGED";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1651:String = "WE_UPDATED";
      
      public static const const_1769:String = "WE_CHILD_RELOCATE";
      
      public static const const_462:String = "WE_CHILD_RELOCATED";
      
      public static const const_1602:String = "WE_CHILD_RESIZE";
      
      public static const const_308:String = "WE_CHILD_RESIZED";
      
      public static const const_1699:String = "WE_CHILD_REMOVE";
      
      public static const const_521:String = "WE_CHILD_REMOVED";
      
      public static const const_1793:String = "WE_PARENT_RELOCATE";
      
      public static const const_1712:String = "WE_PARENT_RELOCATED";
      
      public static const const_1589:String = "WE_PARENT_RESIZE";
      
      public static const const_1362:String = "WE_PARENT_RESIZED";
      
      public static const const_183:String = "WE_OK";
      
      public static const const_681:String = "WE_CANCEL";
      
      public static const const_104:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_486:String = "WE_SCROLL";
      
      public static const const_142:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1904:IWindow;
      
      protected var var_1905:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1904 = param3;
         this.var_1905 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1904;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1905 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1905;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
