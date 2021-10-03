package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_607:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_598:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_607);
         this.var_598 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_598;
      }
   }
}
