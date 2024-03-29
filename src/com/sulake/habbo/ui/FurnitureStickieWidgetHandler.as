package com.sulake.habbo.ui
{
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetStickieDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStickieSendUpdateMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureStickieWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_693:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function FurnitureStickieWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_519;
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
         return [RoomWidgetFurniToWidgetMessage.const_632,RoomWidgetStickieSendUpdateMessage.const_644,RoomWidgetStickieSendUpdateMessage.const_485];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_632:
               _loc2_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc2_.roomId,_loc2_.roomCategory,_loc2_.id,_loc2_.category);
               if(_loc3_ != null)
               {
                  _loc6_ = _loc3_.getModel();
                  if(_loc6_ != null)
                  {
                     _loc7_ = _loc6_.getString(RoomObjectVariableEnum.const_961);
                     if(_loc7_.length < 6)
                     {
                        return null;
                     }
                     _loc9_ = "";
                     if(_loc7_.indexOf(" ") > 0)
                     {
                        _loc8_ = _loc7_.slice(0,_loc7_.indexOf(" "));
                        _loc9_ = _loc7_.slice(_loc7_.indexOf(" ") + 1,_loc7_.length);
                     }
                     else
                     {
                        _loc8_ = _loc7_;
                     }
                     _loc10_ = this._container.roomSession.isRoomOwner || this._container.sessionDataManager.isAnyRoomController;
                     _loc11_ = new RoomWidgetStickieDataUpdateEvent(RoomWidgetStickieDataUpdateEvent.const_663,_loc2_.id,_loc3_.getType(),_loc9_,_loc8_,_loc10_);
                     this._container.events.dispatchEvent(_loc11_);
                  }
               }
               break;
            case RoomWidgetStickieSendUpdateMessage.const_485:
               _loc4_ = param1 as RoomWidgetStickieSendUpdateMessage;
               if(_loc4_ == null)
               {
                  return null;
               }
               if(this._container != null && this._container.roomEngine != null)
               {
                  this._container.roomEngine.modifyRoomObjectData(_loc4_.objectId,RoomObjectCategoryEnum.const_27,_loc4_.colorHex + " " + _loc4_.text);
               }
               break;
            case RoomWidgetStickieSendUpdateMessage.const_644:
               _loc5_ = param1 as RoomWidgetStickieSendUpdateMessage;
               if(_loc5_ == null)
               {
                  return null;
               }
               if(this._container != null && this._container.roomEngine != null)
               {
                  this._container.roomEngine.deleteRoomObject(_loc5_.objectId,RoomObjectCategoryEnum.const_27);
               }
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
