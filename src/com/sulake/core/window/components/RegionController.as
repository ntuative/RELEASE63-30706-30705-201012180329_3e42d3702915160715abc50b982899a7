package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class RegionController extends ContainerController implements IRegionWindow
   {
      
      protected static const const_1125:String = "tool_tip_caption";
      
      protected static const const_819:String = "";
      
      protected static const KEY_TOOLTIP_DELAY:String = "tool_tip_delay";
      
      protected static const const_1529:uint = 500;
       
      
      protected var var_1425:uint = 500;
      
      protected var var_1168:String = "";
      
      public function RegionController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function set mouseCursorType(param1:uint) : void
      {
      }
      
      public function get mouseCursorType() : uint
      {
         return 0;
      }
      
      public function method_5(param1:uint, param2:uint) : void
      {
         throw new Error("Unimplemented method!");
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         throw new Error("Unimplemented method!");
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         this.var_1168 = param1 == null ? "" : param1;
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
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function hideToolTip() : void
      {
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         if(param1 == this)
         {
            InteractiveController.processInteractiveWindowEvents(this,param2);
         }
         return _loc3_;
      }
      
      override public function get properties() : Array
      {
         return InteractiveController.writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function set properties(param1:Array) : void
      {
         InteractiveController.readInteractiveWindowProperties(this,param1);
         super.properties = param1;
      }
   }
}
