package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1504:String = "WN_CRETAE";
      
      public static const const_1468:String = "WN_CREATED";
      
      public static const const_1115:String = "WN_DESTROY";
      
      public static const const_1076:String = "WN_DESTROYED";
      
      public static const const_1007:String = "WN_OPEN";
      
      public static const const_954:String = "WN_OPENED";
      
      public static const const_1048:String = "WN_CLOSE";
      
      public static const const_959:String = "WN_CLOSED";
      
      public static const const_1014:String = "WN_FOCUS";
      
      public static const const_929:String = "WN_FOCUSED";
      
      public static const const_994:String = "WN_UNFOCUS";
      
      public static const const_1010:String = "WN_UNFOCUSED";
      
      public static const const_1011:String = "WN_ACTIVATE";
      
      public static const const_345:String = "WN_ACTVATED";
      
      public static const const_1040:String = "WN_DEACTIVATE";
      
      public static const const_1029:String = "WN_DEACTIVATED";
      
      public static const const_467:String = "WN_SELECT";
      
      public static const const_373:String = "WN_SELECTED";
      
      public static const const_643:String = "WN_UNSELECT";
      
      public static const const_666:String = "WN_UNSELECTED";
      
      public static const const_1095:String = "WN_LOCK";
      
      public static const const_990:String = "WN_LOCKED";
      
      public static const const_979:String = "WN_UNLOCK";
      
      public static const const_1094:String = "WN_UNLOCKED";
      
      public static const const_931:String = "WN_ENABLE";
      
      public static const const_570:String = "WN_ENABLED";
      
      public static const const_949:String = "WN_DISABLE";
      
      public static const const_786:String = "WN_DISABLED";
      
      public static const const_568:String = "WN_RESIZE";
      
      public static const const_175:String = "WN_RESIZED";
      
      public static const const_1015:String = "WN_RELOCATE";
      
      public static const const_482:String = "WN_RELOCATED";
      
      public static const const_1067:String = "WN_MINIMIZE";
      
      public static const const_1052:String = "WN_MINIMIZED";
      
      public static const const_910:String = "WN_MAXIMIZE";
      
      public static const const_893:String = "WN_MAXIMIZED";
      
      public static const const_1054:String = "WN_RESTORE";
      
      public static const const_1008:String = "WN_RESTORED";
      
      public static const const_1630:String = "WN_ARRANGE";
      
      public static const const_1735:String = "WN_ARRANGED";
      
      public static const const_1799:String = "WN_UPDATE";
      
      public static const const_1751:String = "WN_UPDATED";
      
      public static const const_333:String = "WN_CHILD_ADDED";
      
      public static const const_641:String = "WN_CHILD_REMOVED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_259:String = "WN_CHILD_RELOCATED";
      
      public static const const_204:String = "WN_CHILD_ACTIVATED";
      
      public static const const_481:String = "WN_PARENT_ADDED";
      
      public static const const_1079:String = "WN_PARENT_REMOVED";
      
      public static const const_435:String = "WN_PARENT_RESIZED";
      
      public static const const_951:String = "WN_PARENT_RELOCATED";
      
      public static const const_683:String = "WN_PARENT_ACTIVATED";
      
      public static const const_419:String = "WN_STATE_UPDATED";
      
      public static const const_463:String = "WN_STYLE_UPDATED";
      
      public static const const_529:String = "WN_PARAM_UPDATED";
      
      public static const const_1704:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1904,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
