package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_343:int;
      
      private var var_694:Boolean;
      
      private var var_789:String;
      
      private var _ownerName:String;
      
      private var var_1990:int;
      
      private var var_2163:int;
      
      private var var_2337:int;
      
      private var var_1443:String;
      
      private var var_2338:int;
      
      private var var_1993:Boolean;
      
      private var var_670:int;
      
      private var var_1241:int;
      
      private var var_2339:String;
      
      private var var_771:Array;
      
      private var var_2340:RoomThumbnailData;
      
      private var var_2044:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_771 = new Array();
         super();
         this.var_343 = param1.readInteger();
         this.var_694 = param1.readBoolean();
         this.var_789 = param1.readString();
         this._ownerName = param1.readString();
         this.var_1990 = param1.readInteger();
         this.var_2163 = param1.readInteger();
         this.var_2337 = param1.readInteger();
         this.var_1443 = param1.readString();
         this.var_2338 = param1.readInteger();
         this.var_1993 = param1.readBoolean();
         this.var_670 = param1.readInteger();
         this.var_1241 = param1.readInteger();
         this.var_2339 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_771.push(_loc4_);
            _loc3_++;
         }
         this.var_2340 = new RoomThumbnailData(param1);
         this.var_2044 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_771 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_343;
      }
      
      public function get event() : Boolean
      {
         return this.var_694;
      }
      
      public function get roomName() : String
      {
         return this.var_789;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_1990;
      }
      
      public function get userCount() : int
      {
         return this.var_2163;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2337;
      }
      
      public function get description() : String
      {
         return this.var_1443;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2338;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_1993;
      }
      
      public function get score() : int
      {
         return this.var_670;
      }
      
      public function get categoryId() : int
      {
         return this.var_1241;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2339;
      }
      
      public function get tags() : Array
      {
         return this.var_771;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2340;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2044;
      }
   }
}
