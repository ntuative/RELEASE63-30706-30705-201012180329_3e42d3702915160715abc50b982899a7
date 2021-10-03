package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class InteractiveController extends WindowController implements IInteractiveWindow
   {
      
      protected static const const_1125:String = "tool_tip_caption";
      
      protected static const const_819:String = "";
      
      protected static const KEY_TOOLTIP_DELAY:String = "tool_tip_delay";
      
      protected static const const_1529:uint = 500;
      
      protected static var var_258:Array;
       
      
      protected var var_2627:uint = 0;
      
      protected var var_414:Array;
      
      protected var var_1425:uint = 500;
      
      protected var var_1168:String = "";
      
      public function InteractiveController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         this.var_414 = new Array();
         this.var_414[0] = MouseCursorType.const_361;
         this.var_414[1] = MouseCursorType.const_34;
         this.var_414[2] = MouseCursorType.const_361;
         this.var_414[3] = MouseCursorType.const_361;
         this.var_414[4] = MouseCursorType.const_34;
         this.var_414[5] = MouseCursorType.const_34;
         this.var_414[6] = MouseCursorType.const_361;
         if(var_258 == null)
         {
            var_258 = new Array();
            var_258[0] = WindowState.const_97;
            var_258[1] = WindowState.const_78;
            var_258[2] = WindowState.WINDOW_STATE_HOVERING;
            var_258[3] = WindowState.const_62;
            var_258[4] = WindowState.const_46;
            var_258[5] = WindowState.const_84;
            var_258[6] = WindowState.const_70;
         }
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function processInteractiveWindowEvents(param1:IInteractiveWindow, param2:Event) : void
      {
         if(param1.toolTipCaption != const_819)
         {
            if(param2.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type != WindowMouseEvent.const_172)
            {
               if(param2.type == WindowMouseEvent.const_25)
               {
                  param1.context.getWindowServices().getToolTipAgentService().end(param1);
               }
            }
         }
      }
      
      public static function readInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in param2)
         {
            switch(_loc3_.key)
            {
               case const_1125:
                  param1.toolTipCaption = _loc3_.value as String;
                  break;
               case KEY_TOOLTIP_DELAY:
                  param1.toolTipDelay = _loc3_.value as uint;
                  break;
               case "mouse_cursor_hovering":
                  param1.method_5(WindowState.WINDOW_STATE_HOVERING,_loc3_.value as uint);
                  break;
               case "mouse_cursor_pressed":
                  param1.method_5(WindowState.const_84,_loc3_.value as uint);
                  break;
               case "mouse_cursor_disabled":
                  param1.method_5(WindowState.const_70,_loc3_.value as uint);
                  break;
            }
         }
      }
      
      public static function writeInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : Array
      {
         param2.push(new PropertyStruct(const_1125,param1.toolTipCaption,PropertyStruct.const_89,param1.toolTipCaption != const_819));
         param2.push(new PropertyStruct(KEY_TOOLTIP_DELAY,param1.toolTipDelay,PropertyStruct.const_270,param1.toolTipDelay != const_1529));
         return param2;
      }
      
      public function set mouseCursorType(param1:uint) : void
      {
         this.var_2627 = param1;
      }
      
      public function get mouseCursorType() : uint
      {
         return this.var_2627;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         this.var_1168 = param1 == null ? const_819 : param1;
      }
      
      public function get toolTipCaption() : String
      {
         return this.var_1168;
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         this.var_1425 = param1;
      }
      
      public function get toolTipDelay() : uint
      {
         return this.var_1425;
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(param1 == this)
         {
            processInteractiveWindowEvents(this,param2);
         }
         return super.update(param1,param2);
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function hideToolTip() : void
      {
      }
      
      public function method_5(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_258.indexOf(param1);
         if(_loc3_ > -1)
         {
            this.var_414[_loc3_] = param2;
         }
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return this.var_414[_loc2_];
            }
         }
         return MouseCursorType.const_34;
      }
      
      override public function get properties() : Array
      {
         return writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function set properties(param1:Array) : void
      {
         readInteractiveWindowProperties(this,param1);
         super.properties = param1;
      }
   }
}
