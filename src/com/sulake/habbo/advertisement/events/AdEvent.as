package com.sulake.habbo.advertisement.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class AdEvent extends Event
   {
      
      public static const const_525:String = "AE_ROOM_AD_SHOW";
      
      public static const const_495:String = "AE_INTERSTITIAL_SHOW";
      
      public static const const_502:String = "AE_INTERSTITIAL_COMPLETE";
       
      
      private var var_39:BitmapData;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_1178:String;
      
      private var var_2015:BitmapData;
      
      private var var_2014:BitmapData;
      
      public function AdEvent(param1:String, param2:int = 0, param3:int = 0, param4:BitmapData = null, param5:String = "", param6:BitmapData = null, param7:BitmapData = null, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param8,param9);
         this.var_39 = param4;
         this._roomId = param2;
         this._roomCategory = param3;
         this.var_1178 = param5;
         this.var_2015 = param6;
         this.var_2014 = param7;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1178;
      }
      
      public function get adWarningL() : BitmapData
      {
         return this.var_2015;
      }
      
      public function get adWarningR() : BitmapData
      {
         return this.var_2014;
      }
   }
}
