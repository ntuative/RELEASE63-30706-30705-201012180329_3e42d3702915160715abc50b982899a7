package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_59:String = "RODSUE_DIMMER_STATE";
       
      
      private var _state:int;
      
      private var var_2122:int;
      
      private var var_943:int;
      
      private var _color:uint;
      
      private var var_944:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:int, param2:String, param3:int, param4:int, param5:int, param6:uint, param7:int, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_59,param1,param2,param8,param9);
         this._state = param3;
         this.var_2122 = param4;
         this.var_943 = param5;
         this._color = param6;
         this.var_944 = param7;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get presetId() : int
      {
         return this.var_2122;
      }
      
      public function get effectId() : int
      {
         return this.var_943;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : uint
      {
         return this.var_944;
      }
   }
}
