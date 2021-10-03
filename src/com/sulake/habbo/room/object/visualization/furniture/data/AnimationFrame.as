package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_497:int = -1;
      
      public static const const_1099:int = -1;
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_170:int = 0;
      
      private var var_1953:int = 1;
      
      private var var_842:int = 1;
      
      private var var_1604:int = 1;
      
      private var var_2224:int = -1;
      
      private var var_2223:int = 0;
      
      private var var_2222:Boolean = false;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_170 = param3;
         this.var_2222 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_1953 = param4;
         if(param5 < 0)
         {
            param5 = const_497;
         }
         this.var_842 = param5;
         this.var_1604 = param5;
         if(param7 >= 0)
         {
            this.var_2224 = param7;
            this.var_2223 = param8;
         }
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_170;
      }
      
      public function get repeats() : int
      {
         return this.var_1953;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_842;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2222;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_842 < 0)
         {
            return const_497;
         }
         return this.var_1604;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_842 > 0 && param1 > this.var_842)
         {
            param1 = this.var_842;
         }
         this.var_1604 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2224;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2223;
      }
   }
}
