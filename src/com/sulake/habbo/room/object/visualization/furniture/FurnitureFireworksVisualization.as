package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class FurnitureFireworksVisualization extends AnimatedFurnitureVisualization
   {
       
      
      private var var_172:Boolean = false;
      
      private var _particleSystems:Dictionary;
      
      private var var_161:FurnitureParticleSystemEmitter;
      
      private var var_162:BitmapData;
      
      private var _particleSprite:IRoomObjectSprite;
      
      private var var_1320:int = -1;
      
      private var var_1319:Boolean = false;
      
      private var var_1665:int = 0;
      
      private var var_1664:int = 0;
      
      private var var_1064:Number = 1.0;
      
      public function FurnitureFireworksVisualization()
      {
         this._particleSystems = new Dictionary();
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._particleSystems)
         {
            _loc1_.dispose();
         }
         this._particleSystems = null;
         this.var_162 = null;
         super.dispose();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(this.var_172)
         {
            if(this._particleSprite)
            {
               this.var_162.fillRect(this._particleSprite.asset.rect,4278190080);
            }
            if(this.var_161)
            {
               this.var_161.reset();
            }
            this.var_161 = this._particleSystems[param1];
            this.var_1319 = false;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateSprites(param1:int, param2:Boolean, param3:Array) : void
      {
         super.updateSprites(param1,param2,param3);
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(this._particleSprite)
         {
            if(var_351 != _loc4_.getUpdateID() || param1 != var_215)
            {
               this.var_1064 = param1 / 64;
               this.var_162 = this._particleSprite.asset.clone();
               this.var_1665 = this.var_162.width / 2;
               this.var_1664 = this.var_162.height / 2;
               this._particleSprite.asset = this.var_162;
            }
            if(this._particleSprite.asset != this.var_162)
            {
               this._particleSprite.asset = this.var_162;
            }
         }
         if(this.var_161)
         {
            if(!this.var_1319 && this.var_161.hasIgnited)
            {
               this.var_1319 = true;
            }
            if(this.var_1319 && this.var_161.roomObjectSprite)
            {
               this.var_161.roomObjectSprite.visible = false;
            }
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc11_:* = null;
         if(!this.var_172 && spriteCount > 0)
         {
            this.var_172 = this.readDefinition(param1);
         }
         var _loc3_:* = 0;
         var _loc9_:int = 0;
         if(this.var_161)
         {
            _loc9_ = this.var_161.offsetY * this.var_1064;
            this.var_161.update();
            if(this._particleSprite && !this.var_161.isAlive)
            {
               this.var_162.fillRect(this.var_162.rect,4278190080);
               for each(_loc11_ in this.var_161.particles)
               {
                  _loc3_ = Number(_loc11_.y - this.var_161.y * this.var_1064);
                  _loc4_ = this.var_1665 + (_loc11_.x - _loc11_.z) * 10 / 10 * this.var_1064;
                  _loc5_ = this.var_1664 - _loc9_ + (_loc3_ + (_loc11_.x + _loc11_.z) / 2) * 10 / 10 * this.var_1064;
                  _loc7_ = _loc11_.getAsset();
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.asset.content as BitmapData;
                     this.var_162.copyPixels(_loc8_,_loc8_.rect,new Point(_loc4_ + _loc7_.offsetX,_loc5_ + _loc7_.offsetY),null,null,true);
                  }
                  else
                  {
                     _loc6_ = new Rectangle(_loc4_ - 1,_loc5_ - 1,2,2);
                     this.var_162.fillRect(_loc6_,4294967295);
                  }
               }
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(this.var_161 && (this.var_161.controlsRoomItemSprite(param1) || param1 == this.var_1320))
         {
            return this.var_161.y;
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      private function readDefinition(param1:Number) : Boolean
      {
         var obj:IRoomObject = null;
         var particleSystemsData:XML = null;
         var sprite:IRoomObjectSprite = null;
         var emitterData:XML = null;
         var id:int = 0;
         var name:String = null;
         var roomObjectSpriteId:int = 0;
         var emitter:FurnitureParticleSystemEmitter = null;
         var maxNumOfParticles:int = 0;
         var particlesPerFrame:int = 0;
         var burstPulse:int = 0;
         var fuseTime:int = 0;
         var force:Number = NaN;
         var direction:Number = NaN;
         var gravity:Number = NaN;
         var airFriction:Number = NaN;
         var shape:String = null;
         var energy:Number = NaN;
         var lifeTime:int = 0;
         var isEmitter:Boolean = false;
         var frames:Array = null;
         var frameAsset:IGraphicAsset = null;
         var particleData:XML = null;
         var frameData:XML = null;
         var scale:Number = param1;
         obj = object;
         if(obj == null)
         {
            return false;
         }
         var model:IRoomObjectModel = obj.getModel();
         if(model == null)
         {
            return false;
         }
         var definitionString:String = model.getString(RoomObjectVariableEnum.const_1006);
         if(definitionString.length == 0)
         {
            Logger.log("No Particle System Data Found.");
            return false;
         }
         particleSystemsData = XML(definitionString);
         var particleSystemData:XML = particleSystemsData.particlesystem.(@size == scale)[0];
         if(!particleSystemData)
         {
            return false;
         }
         if(particleSystemData.hasOwnProperty("@canvas_id"))
         {
            this.var_1320 = parseInt(particleSystemData.@canvas_id);
            this._particleSprite = getSprite(this.var_1320);
            Logger.log("Canvas: " + this.var_1320 + "  " + this._particleSprite);
            this.var_162 = this._particleSprite.asset.clone();
            this.var_1665 = this.var_162.width / 2;
            this.var_1664 = this.var_162.height / 2;
            this._particleSprite.asset = this.var_162;
            if(this._particleSprite)
            {
               this._particleSprite.capturesMouse = false;
               this._particleSprite.visible = true;
            }
         }
         for each(emitterData in particleSystemData.emitter)
         {
            id = parseInt(emitterData.@id);
            name = emitterData.@name;
            roomObjectSpriteId = parseInt(emitterData.@sprite_id);
            sprite = getSprite(roomObjectSpriteId);
            emitter = new FurnitureParticleSystemEmitter(name,roomObjectSpriteId,sprite);
            this._particleSystems[id] = emitter;
            maxNumOfParticles = parseInt(emitterData.@max_num_particles);
            particlesPerFrame = parseInt(emitterData.@particles_per_frame);
            burstPulse = !!emitterData.hasOwnProperty("@burst_pulse") ? int(parseInt(emitterData.@burst_pulse)) : 1;
            fuseTime = parseInt(emitterData.@fuse_time);
            force = Number(emitterData.simulation.@force);
            direction = Number(emitterData.simulation.@direction);
            gravity = Number(emitterData.simulation.@gravity);
            airFriction = Number(emitterData.simulation.@airfriction);
            shape = emitterData.simulation.@shape;
            energy = Number(emitterData.simulation.@energy);
            for each(particleData in emitterData.particles.particle)
            {
               lifeTime = parseInt(particleData.@lifetime);
               isEmitter = particleData.@is_emitter == "false" ? false : true;
               frames = [];
               for each(frameData in particleData.frame)
               {
                  frameAsset = assetCollection.getAsset(frameData.@name);
                  frames.push(frameAsset);
               }
               emitter.configureParticle(lifeTime,isEmitter,frames);
            }
            emitter.setup(maxNumOfParticles,particlesPerFrame,force,new Vector3D(0,direction,0),gravity,airFriction,shape,energy,fuseTime,burstPulse);
         }
         this.var_172 = true;
         return true;
      }
   }
}
