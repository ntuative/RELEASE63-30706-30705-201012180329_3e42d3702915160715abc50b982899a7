package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2142:Number = 0.0;
      
      private var var_2143:Number = 0.0;
      
      private var var_2141:Number = 0.0;
      
      private var var_2140:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2142 = param1;
         this.var_2143 = param2;
         this.var_2141 = param3;
         this.var_2140 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2142;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2143;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2141;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2140;
      }
   }
}
