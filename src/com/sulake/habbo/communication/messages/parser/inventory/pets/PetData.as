package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PetData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_568:String;
      
      private var _type:int;
      
      public function PetData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_568 = param1.readString();
         this._type = param1.readInteger();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_568;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
