package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1561:int;
      
      private var var_1297:int;
      
      private var var_2011:int;
      
      private var var_2007:int;
      
      private var var_2008:int;
      
      private var _energy:int;
      
      private var var_2009:int;
      
      private var _nutrition:int;
      
      private var var_2012:int;
      
      private var var_2010:int;
      
      private var _ownerName:String;
      
      private var var_1997:int;
      
      private var var_723:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1561;
      }
      
      public function get level() : int
      {
         return this.var_1297;
      }
      
      public function get levelMax() : int
      {
         return this.var_2011;
      }
      
      public function get experience() : int
      {
         return this.var_2007;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2008;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2009;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2012;
      }
      
      public function get ownerId() : int
      {
         return this.var_2010;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_1997;
      }
      
      public function get age() : int
      {
         return this.var_723;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1561 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1297 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2011 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2007 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2008 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2009 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2012 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2010 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_1997 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_723 = param1;
      }
   }
}
