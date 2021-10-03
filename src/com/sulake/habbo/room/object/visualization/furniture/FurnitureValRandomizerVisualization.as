package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_875:int = 20;
      
      private static const const_555:int = 10;
      
      private static const const_1241:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_287:Array;
      
      private var var_647:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_287 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_647)
            {
               this.var_647 = true;
               this.var_287 = new Array();
               this.var_287.push(const_1241);
               this.var_287.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_555)
         {
            if(this.var_647)
            {
               this.var_647 = false;
               this.var_287 = new Array();
               if(_direction == 2)
               {
                  this.var_287.push(const_875 + 5 - param1);
                  this.var_287.push(const_555 + 5 - param1);
               }
               else
               {
                  this.var_287.push(const_875 + param1);
                  this.var_287.push(const_555 + param1);
               }
               this.var_287.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
