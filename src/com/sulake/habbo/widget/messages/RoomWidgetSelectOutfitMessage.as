package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_992:String = "select_outfit";
       
      
      private var var_1918:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_992);
         this.var_1918 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_1918;
      }
   }
}
