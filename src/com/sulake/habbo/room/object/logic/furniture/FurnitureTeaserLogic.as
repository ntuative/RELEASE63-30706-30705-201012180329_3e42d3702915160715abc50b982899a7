package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureTeaserLogic extends FurnitureLogic
   {
       
      
      private const const_1823:String = "TYPE_INJECTED";
      
      public function FurnitureTeaserLogic()
      {
         super();
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         if(param1.type != MouseEvent.CLICK && param1.type != MouseEvent.DOUBLE_CLICK && param1.type != MouseEvent.MOUSE_DOWN)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModelController();
         var _loc4_:String = _loc3_.getString(RoomObjectVariableEnum.const_87);
         if(_loc4_ == this.const_1823)
         {
            if(param1.type == MouseEvent.CLICK || false)
            {
               if(eventDispatcher != null)
               {
                  _loc5_ = object.getId();
                  _loc6_ = object.getType();
                  _loc7_ = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.const_132,_loc5_,_loc6_);
                  eventDispatcher.dispatchEvent(_loc7_);
                  object.setVisualization(null);
               }
            }
            else
            {
               super.mouseEvent(param1,param2);
            }
         }
         else if(param1.type == MouseEvent.DOUBLE_CLICK)
         {
            if(eventDispatcher != null)
            {
               _loc5_ = object.getId();
               _loc6_ = object.getType();
               _loc7_ = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_426,_loc5_,_loc6_);
               eventDispatcher.dispatchEvent(_loc7_);
            }
         }
         else if(param1.type == MouseEvent.MOUSE_DOWN || param1.type == MouseEvent.CLICK)
         {
            super.mouseEvent(param1,param2);
         }
      }
   }
}
