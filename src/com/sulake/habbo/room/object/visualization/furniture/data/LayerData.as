package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_658:String = "";
      
      public static const const_440:int = 0;
      
      public static const const_431:int = 255;
      
      public static const const_700:Boolean = false;
      
      public static const const_414:int = 0;
      
      public static const const_400:int = 0;
      
      public static const const_470:int = 0;
      
      public static const const_922:int = 1;
      
      public static const const_1114:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2166:String = "";
      
      private var var_1551:int = 0;
      
      private var var_2332:int = 255;
      
      private var var_2335:Boolean = false;
      
      private var var_2333:int = 0;
      
      private var var_2334:int = 0;
      
      private var var_2331:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2166 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2166;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1551 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1551;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2332 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2332;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2335 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2335;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2333 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2333;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2334 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2334;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2331 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2331;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
