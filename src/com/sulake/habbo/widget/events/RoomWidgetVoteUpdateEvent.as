package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_128:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_120:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1053:String;
      
      private var var_1373:Array;
      
      private var var_986:Array;
      
      private var var_1773:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1053 = param2;
         this.var_1373 = param3;
         this.var_986 = param4;
         if(this.var_986 == null)
         {
            this.var_986 = [];
         }
         this.var_1773 = param5;
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
   }
}
