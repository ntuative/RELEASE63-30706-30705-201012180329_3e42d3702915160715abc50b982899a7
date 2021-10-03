package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2608:String;
      
      private var var_1855:String;
      
      private var var_2609:String;
      
      private var var_1857:Boolean;
      
      private var var_1856:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2608 = String(param1["set-type"]);
         this.var_1855 = String(param1["flipped-set-type"]);
         this.var_2609 = String(param1["remove-set-type"]);
         this.var_1857 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1856 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1856;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1856 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2608;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1855;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2609;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1857;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1857 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1855 = param1;
      }
   }
}
