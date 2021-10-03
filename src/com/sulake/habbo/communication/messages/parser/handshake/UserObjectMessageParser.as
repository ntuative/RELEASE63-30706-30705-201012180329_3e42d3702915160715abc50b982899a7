package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_568:String;
      
      private var var_884:String;
      
      private var var_2441:String;
      
      private var var_1683:String;
      
      private var var_2437:int;
      
      private var var_2439:String;
      
      private var var_2436:int;
      
      private var var_2440:int;
      
      private var var_2438:int;
      
      private var _respectLeft:int;
      
      private var var_655:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_568 = param1.readString();
         this.var_884 = param1.readString();
         this.var_2441 = param1.readString();
         this.var_1683 = param1.readString();
         this.var_2437 = param1.readInteger();
         this.var_2439 = param1.readString();
         this.var_2436 = param1.readInteger();
         this.var_2440 = param1.readInteger();
         this.var_2438 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_655 = param1.readInteger();
         return true;
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
      
      public function get sex() : String
      {
         return this.var_884;
      }
      
      public function get customData() : String
      {
         return this.var_2441;
      }
      
      public function get realName() : String
      {
         return this.var_1683;
      }
      
      public function get tickets() : int
      {
         return this.var_2437;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2439;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2436;
      }
      
      public function get directMail() : int
      {
         return this.var_2440;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2438;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_655;
      }
   }
}
