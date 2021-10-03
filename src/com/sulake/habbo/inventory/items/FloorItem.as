package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1893:String;
      
      protected var var_1409:Number;
      
      protected var var_2630:Boolean;
      
      protected var var_2629:Boolean;
      
      protected var var_1921:Boolean;
      
      protected var var_2628:Boolean;
      
      protected var var_2640:int;
      
      protected var var_1922:int;
      
      protected var var_1926:int;
      
      protected var var_1924:int;
      
      protected var var_1647:String;
      
      protected var var_2253:int;
      
      protected var var_897:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_1921 = param5;
         this.var_2629 = param6;
         this.var_2630 = param7;
         this.var_2628 = param8;
         this.var_1893 = param9;
         this.var_1409 = param10;
         this.var_2640 = param11;
         this.var_1922 = param12;
         this.var_1926 = param13;
         this.var_1924 = param14;
         this.var_1647 = param15;
         this.var_2253 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1893;
      }
      
      public function get extra() : Number
      {
         return this.var_1409;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2630;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2629;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_1921;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2628;
      }
      
      public function get expires() : int
      {
         return this.var_2640;
      }
      
      public function get creationDay() : int
      {
         return this.var_1922;
      }
      
      public function get creationMonth() : int
      {
         return this.var_1926;
      }
      
      public function get creationYear() : int
      {
         return this.var_1924;
      }
      
      public function get slotId() : String
      {
         return this.var_1647;
      }
      
      public function get songId() : int
      {
         return this.var_2253;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_897 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_897;
      }
   }
}
