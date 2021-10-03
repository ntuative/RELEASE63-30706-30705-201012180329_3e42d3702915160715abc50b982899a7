package com.sulake.habbo.room.events
{
   import flash.events.Event;
   
   public class RoomEngineEvent extends Event
   {
      
      public static const const_771:String = "REE_ENGINE_INITIALIZED";
      
      public static const const_668:String = "REE_INITIALIZED";
      
      public static const const_732:String = "REE_DISPOSED";
      
      public static const const_417:String = "REE_GAME_MODE";
      
      public static const const_488:String = "REE_NORMAL_MODE";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function RoomEngineEvent(param1:String, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._roomId = param2;
         this._roomCategory = param3;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
