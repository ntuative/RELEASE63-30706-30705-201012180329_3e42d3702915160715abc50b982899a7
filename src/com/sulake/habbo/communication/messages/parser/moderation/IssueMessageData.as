package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_144:int = 1;
      
      public static const const_320:int = 2;
      
      public static const const_1395:int = 3;
       
      
      private var var_2105:int;
      
      private var _state:int;
      
      private var var_1241:int;
      
      private var var_2100:int;
      
      private var var_1543:int;
      
      private var var_2104:int;
      
      private var var_2102:int = 0;
      
      private var var_2107:int;
      
      private var var_2103:String;
      
      private var var_1253:int;
      
      private var var_1567:String;
      
      private var var_2106:int;
      
      private var var_2101:String;
      
      private var _message:String;
      
      private var var_2083:int;
      
      private var var_789:String;
      
      private var var_1819:int;
      
      private var var_2109:String;
      
      private var var_343:int;
      
      private var var_2108:String;
      
      private var var_2023:String;
      
      private var var_1994:int;
      
      private var var_2075:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function get issueId() : int
      {
         return this.var_2105;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1241;
      }
      
      public function get reportedCategoryId() : int
      {
         return this.var_2100;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1543;
      }
      
      public function get priority() : int
      {
         return this.var_2104 + this.var_2102;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2107;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2103;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1253;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1567;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2106;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2101;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2083;
      }
      
      public function get roomName() : String
      {
         return this.var_789;
      }
      
      public function get roomType() : int
      {
         return this.var_1819;
      }
      
      public function get flatType() : String
      {
         return this.var_2109;
      }
      
      public function get flatId() : int
      {
         return this.var_343;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2108;
      }
      
      public function get roomResources() : String
      {
         return this.var_2023;
      }
      
      public function get unitPort() : int
      {
         return this.var_1994;
      }
      
      public function get worldId() : int
      {
         return this.var_2075;
      }
      
      public function set issueId(param1:int) : void
      {
         this.var_2105 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1241 = param1;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         this.var_2100 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1543 = param1;
      }
      
      public function set priority(param1:int) : void
      {
         this.var_2104 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2102 = param1;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         this.var_2107 = param1;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         this.var_2103 = param1;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1253 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1567 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         this.var_2106 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         this.var_2101 = param1;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         this.var_2083 = param1;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_789 = param1;
      }
      
      public function set roomType(param1:int) : void
      {
         this.var_1819 = param1;
      }
      
      public function set flatType(param1:String) : void
      {
         this.var_2109 = param1;
      }
      
      public function set flatId(param1:int) : void
      {
         this.var_343 = param1;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         this.var_2108 = param1;
      }
      
      public function set roomResources(param1:String) : void
      {
         this.var_2023 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         this.var_1994 = param1;
      }
      
      public function set worldId(param1:int) : void
      {
         this.var_2075 = param1;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - this.var_1543) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
   }
}
