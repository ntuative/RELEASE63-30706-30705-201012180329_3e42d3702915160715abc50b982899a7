package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_247:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1947:int = 0;
      
      private var var_1946:int = 0;
      
      private var var_1949:int = 0;
      
      private var var_1948:Boolean = false;
      
      private var var_1936:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_247,param6,param7);
         this.var_1947 = param1;
         this.var_1946 = param2;
         this.var_1949 = param3;
         this.var_1948 = param4;
         this.var_1936 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_1947;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_1946;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_1949;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_1948;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1936;
      }
   }
}
