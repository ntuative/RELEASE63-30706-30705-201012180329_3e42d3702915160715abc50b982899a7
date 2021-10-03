package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_128:String = "RSPE_VOTE_QUESTION";
      
      public static const const_120:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1053:String = "";
      
      private var var_1373:Array;
      
      private var var_986:Array;
      
      private var var_1773:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1373 = [];
         this.var_986 = [];
         super(param1,param2,param7,param8);
         this.var_1053 = param3;
         this.var_1373 = param4;
         this.var_986 = param5;
         if(this.var_986 == null)
         {
            this.var_986 = [];
         }
         this.var_1773 = param6;
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
