package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2409:Boolean = false;
      
      private var var_2408:int = 0;
      
      private var var_2406:int = 0;
      
      private var var_2407:int = 0;
      
      private var var_2405:int = 0;
      
      private var var_170:Number = 0;
      
      private var var_171:Number = 0;
      
      private var var_222:String = "";
      
      private var _type:int = 0;
      
      private var var_2708:String = "";
      
      private var var_1409:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_166:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2409 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_166 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2409;
      }
      
      public function get wallX() : Number
      {
         return this.var_2408;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_166)
         {
            this.var_2408 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2406;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_166)
         {
            this.var_2406 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2407;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_166)
         {
            this.var_2407 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2405;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_166)
         {
            this.var_2405 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_170;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_166)
         {
            this.var_170 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_171;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_166)
         {
            this.var_171 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_222;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_166)
         {
            this.var_222 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_166)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_166)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_166)
         {
            this._data = param1;
         }
      }
   }
}
