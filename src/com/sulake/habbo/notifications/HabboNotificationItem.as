package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_79:HabboNotificationItemStyle;
      
      private var var_160:String;
      
      private var _component:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_160 = param1;
         this.var_79 = param2;
         this._component = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_79;
      }
      
      public function get content() : String
      {
         return this.var_160;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_79.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this._component != null)
            {
               this._component.onExecuteLink(_loc2_);
            }
         }
      }
   }
}
