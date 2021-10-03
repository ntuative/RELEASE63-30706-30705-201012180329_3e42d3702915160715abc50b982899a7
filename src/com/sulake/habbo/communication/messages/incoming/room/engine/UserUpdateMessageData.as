package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_170:Number = 0;
      
      private var var_171:Number = 0;
      
      private var var_2576:Number = 0;
      
      private var var_2574:Number = 0;
      
      private var var_2575:Number = 0;
      
      private var var_2573:Number = 0;
      
      private var var_222:int = 0;
      
      private var var_2215:int = 0;
      
      private var var_289:Array;
      
      private var var_2572:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_289 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_170 = param3;
         this.var_171 = param4;
         this.var_2576 = param5;
         this.var_222 = param6;
         this.var_2215 = param7;
         this.var_2574 = param8;
         this.var_2575 = param9;
         this.var_2573 = param10;
         this.var_2572 = param11;
         this.var_289 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_170;
      }
      
      public function get z() : Number
      {
         return this.var_171;
      }
      
      public function get localZ() : Number
      {
         return this.var_2576;
      }
      
      public function get targetX() : Number
      {
         return this.var_2574;
      }
      
      public function get targetY() : Number
      {
         return this.var_2575;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2573;
      }
      
      public function get dir() : int
      {
         return this.var_222;
      }
      
      public function get dirHead() : int
      {
         return this.var_2215;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2572;
      }
      
      public function get actions() : Array
      {
         return this.var_289.slice();
      }
   }
}
