package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2217:int;
      
      private var var_1325:String;
      
      private var _objId:int;
      
      private var var_1582:int;
      
      private var _category:int;
      
      private var var_1893:String;
      
      private var var_2350:Boolean;
      
      private var var_2346:Boolean;
      
      private var var_2347:Boolean;
      
      private var var_2348:Boolean;
      
      private var var_2349:int;
      
      private var var_1409:int;
      
      private var var_1647:String = "";
      
      private var var_2253:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2217 = param1;
         this.var_1325 = param2;
         this._objId = param3;
         this.var_1582 = param4;
         this._category = param5;
         this.var_1893 = param6;
         this.var_2350 = param7;
         this.var_2346 = param8;
         this.var_2347 = param9;
         this.var_2348 = param10;
         this.var_2349 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1647 = param1;
         this.var_1409 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2217;
      }
      
      public function get itemType() : String
      {
         return this.var_1325;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1582;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1893;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2350;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2346;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2347;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2348;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2349;
      }
      
      public function get slotId() : String
      {
         return this.var_1647;
      }
      
      public function get songId() : int
      {
         return this.var_2253;
      }
      
      public function get extra() : int
      {
         return this.var_1409;
      }
   }
}
