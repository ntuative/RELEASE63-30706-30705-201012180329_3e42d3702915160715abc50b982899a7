package com.sulake.habbo.room.object.visualization.furniture.data
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.XMLValidator;
   
   public class AnimationSizeData extends SizeData
   {
       
      
      private var var_293:Map = null;
      
      public function AnimationSizeData(param1:int, param2:int)
      {
         super(param1,param2);
         this.var_293 = new Map();
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.dispose();
         if(this.var_293 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_293.length)
            {
               _loc2_ = this.var_293.getWithIndex(_loc1_) as AnimationData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_293.dispose();
            this.var_293 = null;
         }
      }
      
      public function defineAnimations(param1:XML) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param1 == null)
         {
            return true;
         }
         var _loc2_:* = ["id"];
         var _loc3_:* = null;
         var _loc4_:XMLList = param1.animation;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length())
         {
            _loc6_ = _loc4_[_loc5_];
            if(!XMLValidator.checkRequiredAttributes(_loc6_,_loc2_))
            {
               return false;
            }
            _loc7_ = int(_loc6_.@id);
            _loc3_ = _loc6_.@transitionTo;
            if(_loc3_.length() == 1)
            {
               _loc9_ = int(_loc3_);
               _loc7_ = AnimationData.getTransitionAnimationId(_loc9_);
            }
            _loc8_ = new AnimationData();
            if(!_loc8_.initialize(_loc6_))
            {
               _loc8_.dispose();
               return false;
            }
            this.var_293.add(_loc7_,_loc8_);
            _loc5_++;
         }
         return true;
      }
      
      public function hasAnimation(param1:int) : Boolean
      {
         if(this.var_293.getValue(param1) != null)
         {
            return true;
         }
         return false;
      }
      
      public function getStartFrame(param1:int) : int
      {
         var _loc2_:AnimationData = this.var_293.getValue(param1) as AnimationData;
         if(_loc2_ != null)
         {
            return _loc2_.getStartFrame();
         }
         return 0;
      }
      
      public function getFrame(param1:int, param2:int, param3:int) : AnimationFrame
      {
         var _loc5_:* = null;
         var _loc4_:AnimationData = this.var_293.getValue(param2) as AnimationData;
         if(_loc4_ != null)
         {
            return _loc4_.getFrame(param1,param3);
         }
         return null;
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int, param4:int, param5:int) : AnimationFrame
      {
         var _loc7_:* = null;
         var _loc6_:AnimationData = this.var_293.getValue(param2) as AnimationData;
         if(_loc6_ != null)
         {
            return _loc6_.getFrameFromSequence(param1,param3,param4,param5);
         }
         return null;
      }
   }
}
