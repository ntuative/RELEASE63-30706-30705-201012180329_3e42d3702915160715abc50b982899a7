package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var _x:Number;
      
      private var var_170:Number;
      
      private var var_171:Number;
      
      private var var_1735:Number;
      
      private var var_1738:Number;
      
      private var var_1736:Number;
      
      private var var_1086:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_723:int = 0;
      
      private var var_1737:int;
      
      private var var_2432:Boolean = false;
      
      private var _frames:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function get age() : int
      {
         return this.var_723;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null) : void
      {
         this._x = param1;
         this.var_170 = param2;
         this.var_171 = param3;
         this._direction = new Vector3D(param4.x,param4.y,param4.z);
         this._direction.scaleBy(param5);
         this.var_1735 = this._x - this._direction.x * param6;
         this.var_1738 = this.var_170 - this._direction.y * param6;
         this.var_1736 = this.var_171 - this._direction.z * param6;
         this.var_723 = 0;
         this.var_1086 = false;
         this.var_1737 = param7;
         this.var_2432 = param8;
         this._frames = param9;
      }
      
      public function update() : void
      {
         ++this.var_723;
         if(this.var_723 == this.var_1737)
         {
            this.ignite();
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(this._frames && this._frames.length > 0)
         {
            return this._frames[this.var_723 % this._frames.length];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return this.var_2432;
      }
      
      public function get isAlive() : Boolean
      {
         return this.var_723 <= this.var_1737;
      }
      
      public function dispose() : void
      {
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
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_170 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_171 = param1;
      }
      
      public function get lastX() : Number
      {
         return this.var_1735;
      }
      
      public function set lastX(param1:Number) : void
      {
         this.var_1086 = true;
         this.var_1735 = param1;
      }
      
      public function get lastY() : Number
      {
         return this.var_1738;
      }
      
      public function set lastY(param1:Number) : void
      {
         this.var_1086 = true;
         this.var_1738 = param1;
      }
      
      public function get lastZ() : Number
      {
         return this.var_1736;
      }
      
      public function set lastZ(param1:Number) : void
      {
         this.var_1086 = true;
         this.var_1736 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return this.var_1086;
      }
      
      public function toString() : String
      {
         return [this._x,this.var_170,this.var_171].toString();
      }
   }
}
