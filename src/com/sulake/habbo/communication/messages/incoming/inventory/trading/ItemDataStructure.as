package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1925:int;
      
      private var var_1325:String;
      
      private var var_1920:int;
      
      private var var_1923:int;
      
      private var _category:int;
      
      private var var_1893:String;
      
      private var var_1409:int;
      
      private var var_1919:int;
      
      private var var_1922:int;
      
      private var var_1926:int;
      
      private var var_1924:int;
      
      private var var_1921:Boolean;
      
      private var var_2689:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_1925 = param1;
         this.var_1325 = param2;
         this.var_1920 = param3;
         this.var_1923 = param4;
         this._category = param5;
         this.var_1893 = param6;
         this.var_1409 = param7;
         this.var_1919 = param8;
         this.var_1922 = param9;
         this.var_1926 = param10;
         this.var_1924 = param11;
         this.var_1921 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_1925;
      }
      
      public function get itemType() : String
      {
         return this.var_1325;
      }
      
      public function get roomItemID() : int
      {
         return this.var_1920;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_1923;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1893;
      }
      
      public function get extra() : int
      {
         return this.var_1409;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_1919;
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
      
      public function get groupable() : Boolean
      {
         return this.var_1921;
      }
      
      public function get songID() : int
      {
         return this.var_1409;
      }
   }
}
