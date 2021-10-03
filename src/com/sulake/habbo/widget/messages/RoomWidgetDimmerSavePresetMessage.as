package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_721:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2390:int;
      
      private var var_2388:int;
      
      private var _color:uint;
      
      private var var_944:int;
      
      private var var_2413:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_721);
         this.var_2390 = param1;
         this.var_2388 = param2;
         this._color = param3;
         this.var_944 = param4;
         this.var_2413 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2390;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2388;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_944;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2413;
      }
   }
}
