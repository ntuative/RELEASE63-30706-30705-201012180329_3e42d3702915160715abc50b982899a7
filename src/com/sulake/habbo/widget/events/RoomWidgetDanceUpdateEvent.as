package com.sulake.habbo.widget.events
{
   public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_787:String = "RWUE_DANCE";
       
      
      private var var_79:int;
      
      public function RoomWidgetDanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_787,param2,param3);
         this.var_79 = param1;
      }
      
      public function get style() : int
      {
         return this.var_79;
      }
   }
}
