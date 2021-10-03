package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2459:Number;
      
      private var var_1261:Number;
      
      private var var_895:Number;
      
      private var var_896:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2459 = param1;
         this.var_1261 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_895 = param1;
         this.var_896 = 0;
      }
      
      public function update() : void
      {
         this.var_895 += this.var_1261;
         this.var_896 += this.var_895;
         if(this.var_896 > 0)
         {
            this.var_896 = 0;
            this.var_895 = this.var_2459 * -1 * this.var_895;
         }
      }
      
      public function get location() : Number
      {
         return this.var_896;
      }
   }
}
