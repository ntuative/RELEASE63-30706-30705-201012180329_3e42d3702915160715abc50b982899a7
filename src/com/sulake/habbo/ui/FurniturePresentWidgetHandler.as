package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenedMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class FurniturePresentWidgetHandler implements IRoomWidgetHandler, IGetImageListener
   {
      
      private static const const_195:String = "floor";
      
      private static const const_194:String = "wallpaper";
      
      private static const const_88:String = "landscape";
      
      private static const const_1223:String = "poster";
       
      
      private var var_693:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_312:int = -1;
      
      private var _name:String = "";
      
      public function FurniturePresentWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_448;
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
         return [RoomWidgetFurniToWidgetMessage.const_782,RoomWidgetPresentOpenMessage.const_154,RoomWidgetPresentOpenedMessage.const_1279];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_782:
               _loc2_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc2_.roomId,_loc2_.roomCategory,_loc2_.id,_loc2_.category);
               if(_loc3_ != null)
               {
                  _loc5_ = _loc3_.getModel();
                  if(_loc5_ != null)
                  {
                     this.var_312 = _loc2_.id;
                     _loc6_ = _loc5_.getString(RoomObjectVariableEnum.const_87);
                     if(_loc6_ == null)
                     {
                        _loc6_ = "";
                     }
                     _loc6_ = _loc6_.substr(1);
                     _loc7_ = this._container.roomSession.isRoomOwner || this._container.sessionDataManager.isAnyRoomController;
                     _loc8_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_61,_loc2_.id,_loc6_,_loc7_);
                     this._container.events.dispatchEvent(_loc8_);
                  }
               }
               break;
            case RoomWidgetPresentOpenMessage.const_154:
               _loc4_ = param1 as RoomWidgetPresentOpenMessage;
               if(_loc4_.objectId != this.var_312)
               {
                  return null;
               }
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendPresentOpenMessage(_loc4_.objectId);
               }
               break;
         }
         return null;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:RoomWidgetPresentDataUpdateEvent = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_81,0,this._name,false,param2);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionPresentEvent.const_292];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this._container != null && this._container.events != null && param1 != null)
         {
            switch(param1.type)
            {
               case RoomSessionPresentEvent.const_292:
                  _loc2_ = param1 as RoomSessionPresentEvent;
                  if(_loc2_ != null)
                  {
                     this._name = "";
                     _loc4_ = null;
                     if(_loc2_.itemType == ProductTypeEnum.const_82)
                     {
                        _loc3_ = this._container.sessionDataManager.getFloorItemData(_loc2_.classId);
                     }
                     else if(_loc2_.itemType == ProductTypeEnum.const_79)
                     {
                        _loc3_ = this._container.sessionDataManager.getWallItemData(_loc2_.classId);
                     }
                     switch(_loc2_.itemType)
                     {
                        case ProductTypeEnum.const_79:
                           if(_loc3_ != null && _loc3_.name == const_195)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_395,0,this._container.localization.getKey("inventory.furni.item.floor.name"),false,null);
                           }
                           else if(_loc3_ != null && _loc3_.name == const_88)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_533,0,this._container.localization.getKey("inventory.furni.item.landscape.name"),false,null);
                           }
                           else if(_loc3_ != null && _loc3_.name == const_194)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_404,0,this._container.localization.getKey("inventory.furni.item.wallpaper.name"),false,null);
                           }
                           else
                           {
                              if(_loc3_ != null && _loc3_.name == const_1223)
                              {
                                 break;
                              }
                              _loc4_ = this._container.roomEngine.getWallItemIcon(_loc2_.classId,this);
                              if(_loc3_ != null)
                              {
                                 this._name = _loc3_.title;
                              }
                              if(_loc4_ != null)
                              {
                                 _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_81,0,this._name,false,_loc4_.data);
                              }
                           }
                           break;
                        case ProductTypeEnum.const_329:
                           _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_398,0,this._container.localization.getKey("widget.furni.present.hc"),false,null);
                           break;
                        default:
                           _loc4_ = this._container.roomEngine.getFurnitureIcon(_loc2_.classId,this);
                           if(_loc3_ != null)
                           {
                              this._name = _loc3_.title;
                           }
                           if(_loc4_ != null)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_81,0,this._name,false,_loc4_.data);
                           }
                     }
                     if(_loc5_ != null)
                     {
                        this._container.events.dispatchEvent(_loc5_);
                        break;
                     }
                     break;
                  }
            }
         }
      }
      
      public function update() : void
      {
      }
   }
}
