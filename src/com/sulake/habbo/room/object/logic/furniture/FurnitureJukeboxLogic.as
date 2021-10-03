package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureJukeboxLogic extends FurnitureMultiStateLogic
   {
       
      
      private var include:Boolean;
      
      public function FurnitureJukeboxLogic()
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
         if(object.getModelController().getNumber(RoomObjectVariableEnum.const_1023) == 1 && !this.include)
         {
            this.requestInit();
         }
      }
      
      private function requestInit() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_445,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
         this.include = true;
      }
      
      private function requestDispose() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_447,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
   }
}
