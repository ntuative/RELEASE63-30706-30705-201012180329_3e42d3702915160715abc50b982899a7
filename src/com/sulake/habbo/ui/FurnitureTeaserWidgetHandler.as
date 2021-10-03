package com.sulake.habbo.ui
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.events.RoomSessionViralFurniStatusEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetTeaserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetViralFurniMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureTeaserWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_693:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function FurnitureTeaserWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_453;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function dispose() : void
      {
         this.var_693 = true;
         this._container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_780,RoomWidgetViralFurniMessage.const_654,RoomWidgetViralFurniMessage.const_154];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_780:
               _loc2_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc2_.roomId,_loc2_.roomCategory,_loc2_.id,_loc2_.category);
               if(_loc3_ != null)
               {
                  _loc5_ = _loc3_.getModel();
                  if(_loc5_ != null)
                  {
                     _loc6_ = _loc5_.getString(RoomObjectVariableEnum.const_87);
                     _loc7_ = new RoomWidgetTeaserDataUpdateEvent(RoomWidgetTeaserDataUpdateEvent.const_508);
                     _loc7_.data = _loc6_;
                     this._container.events.dispatchEvent(_loc7_);
                  }
               }
               break;
            case RoomWidgetViralFurniMessage.const_654:
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendViralFurniFoundMessage();
               }
               break;
            case RoomWidgetViralFurniMessage.const_154:
               _loc4_ = param1 as RoomWidgetViralFurniMessage;
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendPresentOpenMessage(_loc4_.objectId);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionViralFurniStatusEvent.const_506,RoomSessionViralFurniStatusEvent.const_499];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._container == null || this._container.events == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionViralFurniStatusEvent.const_506:
               _loc2_ = param1 as RoomSessionViralFurniStatusEvent;
               _loc3_ = new RoomWidgetTeaserDataUpdateEvent(RoomWidgetTeaserDataUpdateEvent.const_784);
               _loc3_.objectId = _loc2_.objectId;
               _loc3_.status = _loc2_.status;
               _loc3_.data = _loc2_.shareId;
               _loc3_.firstClickUserName = _loc2_.firstClickUserName;
               _loc3_.ownRealName = this._container.sessionDataManager.realName;
               this._container.events.dispatchEvent(_loc3_);
               break;
            case RoomSessionViralFurniStatusEvent.const_499:
               _loc2_ = param1 as RoomSessionViralFurniStatusEvent;
               _loc3_ = new RoomWidgetTeaserDataUpdateEvent(RoomWidgetTeaserDataUpdateEvent.const_761);
               _loc3_.status = _loc2_.status;
               _loc3_.data = _loc2_.shareId;
               _loc3_.firstClickUserName = _loc2_.firstClickUserName;
               this._container.events.dispatchEvent(_loc3_);
               break;
            default:
               Logger.log("Error, invalid viral room event type: " + param1.type);
         }
      }
      
      public function update() : void
      {
      }
   }
}
