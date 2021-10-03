package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1004:String = "M";
      
      public static const const_1409:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_170:Number = 0;
      
      private var var_171:Number = 0;
      
      private var var_222:int = 0;
      
      private var _name:String = "";
      
      private var var_2443:int = 0;
      
      private var var_884:String = "";
      
      private var var_568:String = "";
      
      private var var_2380:String = "";
      
      private var var_2207:int;
      
      private var var_2205:int = 0;
      
      private var var_2381:String = "";
      
      private var var_2379:int = 0;
      
      private var var_2211:int = 0;
      
      private var var_2444:String = "";
      
      private var var_166:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_166 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_166)
         {
            this._x = param1;
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
      
      public function get dir() : int
      {
         return this.var_222;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_166)
         {
            this.var_222 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_166)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2443;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_166)
         {
            this.var_2443 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_884;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_166)
         {
            this.var_884 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_568;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_166)
         {
            this.var_568 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2380;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_166)
         {
            this.var_2380 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2207;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_166)
         {
            this.var_2207 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2205;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_166)
         {
            this.var_2205 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2381;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_166)
         {
            this.var_2381 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2379;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_166)
         {
            this.var_2379 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2211;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_166)
         {
            this.var_2211 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2444;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_166)
         {
            this.var_2444 = param1;
         }
      }
   }
}
