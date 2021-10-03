package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_884:String = "";
      
      private var var_568:String = "";
      
      private var var_2380:String = "";
      
      private var var_2207:int;
      
      private var var_2205:int = 0;
      
      private var var_2381:String = "";
      
      private var var_2379:int = 0;
      
      private var var_2211:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2207;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2207 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_884;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_884 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_568;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_568 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2380;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2380 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2205;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2205 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2381;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2381 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2379;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2379 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2211;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2211 = param1;
      }
   }
}
