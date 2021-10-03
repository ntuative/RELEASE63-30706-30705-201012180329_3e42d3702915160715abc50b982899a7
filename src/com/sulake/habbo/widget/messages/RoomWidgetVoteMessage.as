package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_112:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1852:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_112);
         this.var_1852 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1852;
      }
   }
}
