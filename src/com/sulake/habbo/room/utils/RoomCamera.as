package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_886:int = 3;
       
      
      private var var_2578:int = -1;
      
      private var var_2581:int = -2;
      
      private var var_348:Vector3d = null;
      
      private var var_411:Vector3d = null;
      
      private var var_2586:Boolean = false;
      
      private var var_2577:Boolean = false;
      
      private var var_2585:Boolean = false;
      
      private var var_2579:Boolean = false;
      
      private var var_2583:int = 0;
      
      private var var_2582:int = 0;
      
      private var var_2584:int = 0;
      
      private var var_2580:int = 0;
      
      private var var_1413:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_411;
      }
      
      public function get targetId() : int
      {
         return this.var_2578;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2581;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2586;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2577;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2585;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2579;
      }
      
      public function get screenWd() : int
      {
         return this.var_2583;
      }
      
      public function get screenHt() : int
      {
         return this.var_2582;
      }
      
      public function get roomWd() : int
      {
         return this.var_2584;
      }
      
      public function get roomHt() : int
      {
         return this.var_2580;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2578 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2581 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2586 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2577 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2585 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2579 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2583 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2582 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2584 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2580 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_348 == null)
         {
            this.var_348 = new Vector3d();
         }
         if(this.var_348.x != param1.x || this.var_348.y != param1.y || this.var_348.z != param1.z)
         {
            this.var_348.assign(param1);
            this.var_1413 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_348 = null;
         this.var_411 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_411 != null)
         {
            return;
         }
         this.var_411 = new Vector3d();
         this.var_411.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_348 != null && this.var_411 != null)
         {
            ++this.var_1413;
            _loc4_ = Vector3d.dif(this.var_348,this.var_411);
            if(_loc4_.length <= param2)
            {
               this.var_411 = this.var_348;
               this.var_348 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_886 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1413 <= const_886)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_411 = Vector3d.sum(this.var_411,_loc4_);
            }
         }
      }
   }
}
