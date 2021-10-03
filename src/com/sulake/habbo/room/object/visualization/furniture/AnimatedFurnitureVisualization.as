package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.data.AnimationData;
   import com.sulake.habbo.room.object.visualization.furniture.data.AnimationFrame;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class AnimatedFurnitureVisualization extends FurnitureVisualization
   {
       
      
      private var var_498:AnimatedFurnitureVisualizationData = null;
      
      private var _state:int = -1;
      
      private var var_1103:int = 0;
      
      private var var_560:int = 0;
      
      private var var_1102:Boolean = false;
      
      private var var_1777:int = 0;
      
      private var var_497:Array;
      
      private var var_605:Array;
      
      private var _animationPlayed:Array;
      
      private var var_1776:Number = 0;
      
      private var var_1700:int = 0;
      
      public function AnimatedFurnitureVisualization()
      {
         this.var_497 = [];
         this.var_605 = [];
         this._animationPlayed = [];
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_498 = null;
         this.var_497 = null;
         this.var_605 = null;
         this._animationPlayed = null;
      }
      
      public function get animationId() : int
      {
         return this.var_1103;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!(param1 is AnimatedFurnitureVisualizationData))
         {
            return false;
         }
         this.var_498 = param1 as AnimatedFurnitureVisualizationData;
         return super.initialize(param1);
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(super.updateObject(param1,param2))
         {
            _loc3_ = object;
            if(_loc3_ == null)
            {
               return false;
            }
            _loc4_ = _loc3_.getState(0);
            if(_loc4_ != this._state)
            {
               this.setAnimation(_loc4_);
               this._state = _loc4_;
               _loc5_ = _loc3_.getModel();
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.getNumber(RoomObjectVariableEnum.const_667);
                  this.var_1777 = _loc6_;
               }
            }
            return true;
         }
         return false;
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(super.updateModel(param1))
         {
            _loc2_ = object;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.getModel();
               if(_loc3_ != null)
               {
                  if(this.usesAnimationResetting())
                  {
                     _loc4_ = _loc3_.getNumber(RoomObjectVariableEnum.const_667);
                     if(_loc4_ > this.var_1777)
                     {
                        this.var_1777 = _loc4_;
                        this.setAnimation(this._state);
                     }
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      private function resetAnimationFrames() : void
      {
         this.var_497 = [];
         this.var_605 = [];
         this._animationPlayed = [];
         this.var_1102 = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1700)
         {
            this.var_497[_loc1_] = null;
            this.var_605[_loc1_] = false;
            this._animationPlayed[_loc1_] = false;
            _loc1_++;
         }
      }
      
      protected function setAnimation(param1:int) : void
      {
         if(this.var_498 != null && this._state >= 0)
         {
            if(this.var_498.hasAnimation(AnimationData.getTransitionAnimationId(param1),this.var_1776))
            {
               if(this.var_1103 != AnimationData.getTransitionAnimationId(param1))
               {
                  param1 = AnimationData.getTransitionAnimationId(param1);
               }
            }
         }
         this.var_1103 = param1;
         this.var_560 = 0;
         this.resetAnimationFrames();
      }
      
      protected function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 < 0 || param1 >= this.var_605.length)
         {
            return false;
         }
         return this.var_605[param1];
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_498 == null)
         {
            return null;
         }
         if(param1 != this.var_1776)
         {
            this.var_1700 = this.var_498.getLayerCount(param1);
            this.resetAnimationFrames();
         }
         var _loc2_:Array = this.updateAnimationFrames(param1);
         if(this.var_1102 && _loc2_ != null && AnimationData.isTransitionAnimation(this.var_1103))
         {
            this.setAnimation(AnimationData.getAnimationId(this.var_1103));
            _loc2_ = this.updateAnimationFrames(param1);
         }
         this.var_1776 = param1;
         return _loc2_;
      }
      
      private function updateAnimationFrames(param1:Number) : Array
      {
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(this.var_1102)
         {
            return null;
         }
         if(this.var_560 == 0)
         {
            this.var_560 = this.var_498.getStartFrame(this.animationId,param1);
         }
         this.var_560 += 1;
         var _loc3_:* = null;
         this.var_1102 = true;
         var _loc4_:int = this.var_1700 - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this._animationPlayed[_loc4_];
            if(!_loc5_)
            {
               _loc6_ = this.var_605[_loc4_];
               _loc7_ = this.var_497[_loc4_] as AnimationFrame;
               if(_loc7_ != null)
               {
                  if(_loc7_.isLastFrame && _loc7_.remainingFrameRepeats <= 1)
                  {
                     _loc6_ = true;
                  }
               }
               if(_loc7_ == null || _loc7_.remainingFrameRepeats >= 0 && _loc9_ <= 0)
               {
                  _loc8_ = 0;
                  if(_loc7_ != null)
                  {
                     _loc8_ = _loc7_.activeSequence;
                  }
                  if(_loc8_ == AnimationFrame.const_1099)
                  {
                     _loc7_ = this.var_498.getFrame(_loc4_,this.animationId,this.var_560,param1);
                  }
                  else
                  {
                     _loc7_ = this.var_498.getFrameFromSequence(_loc4_,this.animationId,_loc8_,_loc7_.activeSequenceOffset + _loc7_.repeats,this.var_560,param1);
                  }
                  this.var_497[_loc4_] = _loc7_;
                  if(_loc3_ != null)
                  {
                     _loc3_.push(_loc4_);
                  }
                  else
                  {
                     _loc3_ = [_loc4_];
                  }
               }
               if(_loc7_ == null || _loc7_.remainingFrameRepeats == AnimationFrame.const_497)
               {
                  _loc6_ = true;
                  _loc5_ = true;
               }
               else
               {
                  this.var_1102 = false;
               }
               this.var_605[_loc4_] = _loc6_;
               this._animationPlayed[_loc4_] = _loc5_;
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:AnimationFrame = this.var_497[param1] as AnimationFrame;
         if(_loc3_ != null)
         {
            return _loc3_.id;
         }
         return super.getFrameNumber(param1,param2);
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = super.getSpriteXOffset(param1,param2,param3);
         var _loc5_:AnimationFrame = this.var_497[param1] as AnimationFrame;
         if(_loc5_ != null)
         {
            _loc4_ += _loc5_.x;
         }
         return _loc4_;
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = super.getSpriteYOffset(param1,param2,param3);
         var _loc5_:AnimationFrame = this.var_497[param1] as AnimationFrame;
         if(_loc5_ != null)
         {
            _loc4_ += _loc5_.y;
         }
         return _loc4_;
      }
      
      protected function usesAnimationResetting() : Boolean
      {
         return false;
      }
   }
}
