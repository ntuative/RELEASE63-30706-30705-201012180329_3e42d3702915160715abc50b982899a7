package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_875:int = 20;
      
      private static const const_555:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_287:Array;
      
      private var var_647:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_287 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_647)
            {
               this.var_647 = true;
               this.var_287 = new Array();
               this.var_287.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_647)
            {
               this.var_647 = false;
               this.var_287 = new Array();
               this.var_287.push(const_875);
               this.var_287.push(const_555 + param1);
               this.var_287.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_287.length > 0)
            {
               super.setAnimation(this.var_287.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
