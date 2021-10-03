package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1723:String = "";
      
      private var var_2523:String = "";
      
      private var var_2526:String = "";
      
      private var var_2525:Number = 0;
      
      private var var_2524:Number = 0;
      
      private var var_2407:Number = 0;
      
      private var var_2405:Number = 0;
      
      private var var_2000:Boolean = false;
      
      private var var_2002:Boolean = false;
      
      private var var_2001:Boolean = false;
      
      private var var_1999:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1723 = param2;
         this.var_2523 = param3;
         this.var_2526 = param4;
         this.var_2525 = param5;
         this.var_2524 = param6;
         this.var_2407 = param7;
         this.var_2405 = param8;
         this.var_2000 = param9;
         this.var_2002 = param10;
         this.var_2001 = param11;
         this.var_1999 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1723;
      }
      
      public function get canvasId() : String
      {
         return this.var_2523;
      }
      
      public function get method_1() : String
      {
         return this.var_2526;
      }
      
      public function get screenX() : Number
      {
         return this.var_2525;
      }
      
      public function get screenY() : Number
      {
         return this.var_2524;
      }
      
      public function get localX() : Number
      {
         return this.var_2407;
      }
      
      public function get localY() : Number
      {
         return this.var_2405;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2000;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2002;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2001;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_1999;
      }
   }
}
