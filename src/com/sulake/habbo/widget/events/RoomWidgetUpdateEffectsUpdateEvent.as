package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_585:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_228:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_585,param2,param3);
         this.var_228 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_228;
      }
   }
}
