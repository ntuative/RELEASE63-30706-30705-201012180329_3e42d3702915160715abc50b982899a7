package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1305:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_773:String = "RWSSM_STORE_SOUND";
      
      public static const const_733:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_495:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_495;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_495 = param1;
      }
   }
}
