package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrameData
   {
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_170:int = 0;
      
      private var var_1951:int = 0;
      
      private var var_1952:int = 0;
      
      private var var_1953:int = 1;
      
      public function AnimationFrameData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_170 = param3;
         this.var_1951 = param4;
         this.var_1952 = param5;
         this.var_1953 = param6;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_170;
      }
      
      public function get randomX() : int
      {
         return this.var_1951;
      }
      
      public function get randomY() : int
      {
         return this.var_1952;
      }
      
      public function get repeats() : int
      {
         return this.var_1953;
      }
   }
}
