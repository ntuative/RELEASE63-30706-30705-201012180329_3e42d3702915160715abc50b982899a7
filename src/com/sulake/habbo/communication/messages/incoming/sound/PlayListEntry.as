package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2253:int;
      
      private var var_2343:int;
      
      private var var_2344:String;
      
      private var var_2341:String;
      
      private var var_2342:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2253 = param1;
         this.var_2343 = param2;
         this.var_2344 = param3;
         this.var_2341 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2253;
      }
      
      public function get length() : int
      {
         return this.var_2343;
      }
      
      public function get name() : String
      {
         return this.var_2344;
      }
      
      public function get creator() : String
      {
         return this.var_2341;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2342;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2342 = param1;
      }
   }
}
