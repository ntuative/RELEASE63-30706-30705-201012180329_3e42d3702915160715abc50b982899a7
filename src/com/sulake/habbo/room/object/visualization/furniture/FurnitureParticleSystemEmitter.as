package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class FurnitureParticleSystemEmitter extends FurnitureParticleSystemParticle
   {
      
      public static const const_1348:String = "cone";
      
      public static const const_1422:String = "plane";
      
      public static const const_1300:String = "sphere";
       
      
      private var _name:String;
      
      private var _roomObjectSpriteId:int = -1;
      
      private var var_669:IRoomObjectSprite;
      
      private var var_1574:Number;
      
      private var _direction:Vector3D;
      
      private var var_828:Number = 0.1;
      
      private var var_1261:Number;
      
      private var var_196:Number;
      
      private var var_1573:String;
      
      private var var_1262:Array;
      
      private var var_314:Array;
      
      private var var_1575:int;
      
      private var var_1576:int;
      
      private var var_1263:int;
      
      private var var_1578:int = 10;
      
      private var _energy:Number = 1;
      
      private var var_1319:Boolean = false;
      
      private var var_1577:int = 1;
      
      public function FurnitureParticleSystemEmitter(param1:String = "", param2:int = -1, param3:IRoomObjectSprite = null)
      {
         this.var_314 = [];
         super();
         this._name = param1;
         this._roomObjectSpriteId = param2;
         this.var_669 = param3;
         this.var_1262 = [];
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_314)
         {
            _loc1_.dispose();
         }
         this.var_314 = null;
         if(this.var_669)
         {
            this.var_669.offsetY = 0;
         }
         super.dispose();
      }
      
      public function setup(param1:int, param2:int, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:String, param8:Number, param9:int, param10:int) : void
      {
         this.var_1575 = param1;
         this.var_1576 = param2;
         this.var_1574 = param3;
         this._direction = param4;
         this._direction.normalize();
         this.var_1261 = param5;
         this.var_196 = param6;
         this.var_1573 = param7;
         this.var_1578 = param9;
         this._energy = param8;
         this.var_1577 = param10;
         Logger.log("Max Number of Particles: " + this.var_1575);
         Logger.log("Particles per Frame: " + this.var_1576);
         Logger.log("Force: " + this.var_1574);
         Logger.log("Direction: " + this._direction);
         Logger.log("Gravity: " + this.var_1261);
         Logger.log("Air friction: " + this.var_196);
         Logger.log("Explosion shape: " + this.var_1573);
         Logger.log("Energy: " + this._energy);
         Logger.log("Fuse Time: " + this.var_1578);
         Logger.log("Burst Pulse: " + this.var_1577);
         this.reset();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_314)
         {
            _loc1_.dispose();
         }
         this.var_314 = [];
         this.var_1263 = 0;
         this.var_1319 = false;
         this.init(0,0,0,this._direction,this.var_1574,this.var_828,this.var_1578,true);
         if(this.var_669)
         {
            this.var_669.offsetY = 0;
         }
      }
      
      public function configureParticle(param1:int, param2:Boolean, param3:Array) : void
      {
         var _loc4_:Dictionary = new Dictionary();
         _loc4_["lifeTime"] = param1;
         _loc4_["isEmitter"] = param2;
         _loc4_["frames"] = param3;
         this.var_1262.push(_loc4_);
      }
      
      override protected function ignite() : void
      {
         this.var_1319 = true;
      }
      
      private function releaseParticles(param1:FurnitureParticleSystemParticle, param2:Vector3D = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc8_:* = null;
         if(!param2)
         {
            param2 = new Vector3D();
         }
         var _loc3_:Vector3D = new Vector3D();
         var _loc7_:Boolean = false;
         _loc5_ = this.getRandomParticleConfiguration();
         var _loc9_:int = 0;
         while(_loc9_ < this.var_1576)
         {
            switch(this.var_1573)
            {
               case const_1348:
                  _loc3_.x = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.y = -(Math.random() + 1);
                  _loc3_.z = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  break;
               case const_1422:
                  _loc3_.x = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.y = 0;
                  _loc3_.z = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  break;
               case const_1300:
                  _loc3_.x = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.y = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  _loc3_.z = !!this.randomBoolean(0.5) ? Number(Math.random()) : Number(-Math.random());
                  break;
            }
            _loc3_.normalize();
            _loc4_ = new FurnitureParticleSystemParticle();
            if(_loc5_)
            {
               _loc6_ = Math.floor(Math.random() * _loc5_["lifeTime"] + 10);
               _loc7_ = _loc5_["isEmitter"];
               _loc8_ = _loc5_["frames"];
            }
            else
            {
               _loc6_ = Math.floor(Math.random() * 20 + 10);
               _loc7_ = false;
               _loc8_ = [];
            }
            _loc4_.init(param1.x,param1.y,param1.z,_loc3_,this._energy,this.var_828,_loc6_,_loc7_,_loc8_);
            this.var_314.push(_loc4_);
            ++this.var_1263;
            _loc9_++;
         }
      }
      
      private function getRandomParticleConfiguration() : Dictionary
      {
         var _loc1_:int = Math.floor(Math.random() * this.var_1262.length);
         return this.var_1262[_loc1_];
      }
      
      public function get offsetY() : int
      {
         return 25;
      }
      
      override public function update() : void
      {
         super.update();
         this.accumulateForces();
         this.verlet();
         this.satisfyConstraints();
         if(!isAlive && this.var_1263 < this.var_1575)
         {
            if(this.age % this.var_1577 == 0)
            {
               this.releaseParticles(this,this.direction);
            }
         }
      }
      
      public function verlet() : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(isAlive)
         {
            _loc3_ = this.x;
            _loc4_ = this.y;
            _loc5_ = this.z;
            this.x = (2 - this.var_196) * this.x - (1 - this.var_196) * this.lastX;
            this.y = (2 - this.var_196) * this.y - (1 - this.var_196) * this.lastY + this.var_1261 * this.var_828 * this.var_828;
            this.z = (2 - this.var_196) * this.z - (1 - this.var_196) * this.lastZ;
            this.lastX = _loc3_;
            this.lastY = _loc4_;
            this.lastZ = _loc5_;
         }
         var _loc1_:* = [];
         for each(_loc2_ in this.var_314)
         {
            _loc2_.update();
            _loc3_ = _loc2_.x;
            _loc4_ = _loc2_.y;
            _loc5_ = _loc2_.z;
            _loc2_.x = (2 - this.var_196) * _loc2_.x - (1 - this.var_196) * _loc2_.lastX;
            _loc2_.y = (2 - this.var_196) * _loc2_.y - (1 - this.var_196) * _loc2_.lastY + this.var_1261 * this.var_828 * this.var_828;
            _loc2_.z = (2 - this.var_196) * _loc2_.z - (1 - this.var_196) * _loc2_.lastZ;
            _loc2_.lastX = _loc3_;
            _loc2_.lastY = _loc4_;
            _loc2_.lastZ = _loc5_;
            if(_loc2_.y > 10 || !_loc2_.isAlive)
            {
               _loc1_.push(_loc2_);
            }
         }
         for each(_loc2_ in _loc1_)
         {
            if(!_loc2_.isEmitter)
            {
            }
            this.var_314.splice(this.var_314.indexOf(_loc2_),1);
            _loc2_.dispose();
         }
      }
      
      private function satisfyConstraints() : void
      {
      }
      
      private function accumulateForces() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_314)
         {
         }
      }
      
      public function controlsRoomItemSprite(param1:int) : Boolean
      {
         return this.var_669 && this._roomObjectSpriteId == param1;
      }
      
      public function get particles() : Array
      {
         return this.var_314;
      }
      
      public function get hasIgnited() : Boolean
      {
         return this.var_1319;
      }
      
      public function get roomObjectSprite() : IRoomObjectSprite
      {
         return this.var_669;
      }
      
      private function randomBoolean(param1:Number) : Boolean
      {
         return Math.random() < param1;
      }
   }
}
