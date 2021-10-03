package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_676:int = 1;
      
      public static const const_631:int = 2;
      
      public static const const_807:int = 3;
      
      public static const const_968:int = 4;
      
      public static const const_637:int = 5;
      
      public static const const_1100:int = 6;
       
      
      private var _type:int;
      
      private var var_1142:int;
      
      private var var_2144:String;
      
      private var var_2534:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1142 = param2;
         this.var_2144 = param3;
         this.var_2534 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2144;
      }
      
      public function get time() : String
      {
         return this.var_2534;
      }
      
      public function get senderId() : int
      {
         return this.var_1142;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
