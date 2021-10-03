package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1053:String;
      
      private var var_1373:Array;
      
      private var var_986:Array;
      
      private var var_1773:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1053;
      }
      
      public function get choices() : Array
      {
         return this.var_1373.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_986.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1773;
      }
      
      public function flush() : Boolean
      {
         this.var_1053 = "";
         this.var_1373 = [];
         this.var_986 = [];
         this.var_1773 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1053 = param1.readString();
         this.var_1373 = [];
         this.var_986 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1373.push(param1.readString());
            this.var_986.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1773 = param1.readInteger();
         return true;
      }
   }
}
