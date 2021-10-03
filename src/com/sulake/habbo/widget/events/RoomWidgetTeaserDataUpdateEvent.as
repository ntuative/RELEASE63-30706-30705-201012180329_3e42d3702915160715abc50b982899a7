package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_508:String = "RWTDUE_TEASER_DATA";
      
      public static const const_784:String = "RWTDUE_GIFT_DATA";
      
      public static const const_761:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_312:int;
      
      private var _data:String;
      
      private var _status:int;
      
      private var var_2004:String;
      
      private var var_2355:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_312;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2004;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2355;
      }
      
      public function set status(param1:int) : void
      {
         this._status = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2004 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2355 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_312 = param1;
      }
   }
}
