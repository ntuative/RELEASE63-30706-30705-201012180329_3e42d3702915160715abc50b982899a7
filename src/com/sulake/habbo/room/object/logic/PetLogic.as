package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class PetLogic extends MovingObjectLogic
   {
       
      
      private var var_1185:int = 0;
      
      private var var_1184:int = 0;
      
      private var var_946:int = 0;
      
      private var var_179:Boolean = false;
      
      private var var_421:Vector3d = null;
      
      public function PetLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_179 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_396,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         this.var_421 = null;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_487,_loc3_.postureType);
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc4_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_371,_loc4_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_256,1);
            this.var_1185 = getTimer() + _loc5_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarPetGestureUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarPetGestureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_293,_loc6_.gesture);
            this.var_1184 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc7_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_221,1);
               this.var_946 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_221,0);
               this.var_946 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_428,Number(_loc8_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarSelectedMessage;
            this.var_179 = _loc9_.selected;
            this.var_421 = null;
            return;
         }
         if(param1 is RoomObjectAvatarExperienceUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarExperienceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1080,Number(getTimer()));
            _loc2_.setNumber(RoomObjectVariableEnum.const_956,Number(_loc10_.gainedExperience));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc12_ = _loc2_.getString(RoomObjectVariableEnum.const_186);
            _loc2_.setString(RoomObjectVariableEnum.const_186,_loc11_.figure);
            _loc2_.setString(RoomObjectVariableEnum.const_1511,_loc11_.race);
            return;
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_243,param1.eventId,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(this.var_179 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(this.var_421 == null || this.var_421.x != _loc2_.x || this.var_421.y != _loc2_.y || this.var_421.z != _loc2_.z)
               {
                  if(this.var_421 == null)
                  {
                     this.var_421 = new Vector3d();
                  }
                  this.var_421.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_540,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            this.updateActions(param1,object.getModelController());
         }
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(this.var_1184 > 0 && param1 > this.var_1184)
         {
            param2.setString(RoomObjectVariableEnum.const_293,null);
            this.var_1184 = 0;
         }
         if(this.var_1185 > 0)
         {
            if(param1 > this.var_1185)
            {
               param2.setNumber(RoomObjectVariableEnum.const_256,0);
               this.var_1185 = 0;
            }
         }
         if(this.var_946 > 0 && param1 > this.var_946)
         {
            param2.setNumber(RoomObjectVariableEnum.const_221,0);
            this.var_946 = 0;
         }
      }
   }
}
