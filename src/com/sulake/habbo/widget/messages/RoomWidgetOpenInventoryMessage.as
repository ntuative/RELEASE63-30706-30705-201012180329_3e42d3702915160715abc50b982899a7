package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_793:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1056:String = "inventory_effects";
      
      public static const const_1086:String = "inventory_badges";
      
      public static const const_1363:String = "inventory_clothes";
      
      public static const const_1521:String = "inventory_furniture";
       
      
      private var var_2021:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_793);
         this.var_2021 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2021;
      }
   }
}
