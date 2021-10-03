package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class FurnitureSoundMachineLogic extends FurnitureMultiStateLogic
   {
       
      
      private var var_2081:Boolean;
      
      public function FurnitureSoundMachineLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         this.requestDispose();
         super.dispose();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         super.processUpdateMessage(param1);
         if(object == null)
         {
            return;
         }
         var _loc2_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:String = _loc3_.getString(RoomObjectVariableEnum.const_87);
         if(_loc4_ == "1")
         {
            this.requestPlayList();
         }
         else if(_loc4_ == "0")
         {
            this.requestStopPlaying();
         }
      }
      
      private function requestPlayList() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         this.var_2081 = true;
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.ROOM_OBJECT_SOUND_MACHINE_START,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestStopPlaying() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_520,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestDispose() : void
      {
         if(!this.var_2081)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_399,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
   }
}
