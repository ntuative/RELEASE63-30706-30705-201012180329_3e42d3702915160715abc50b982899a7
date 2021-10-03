package com.sulake.habbo.notifications
{
   import com.sulake.core.runtime.IUnknown;
   import flash.display.BitmapData;
   
   public interface IHabboNotifications extends IUnknown
   {
       
      
      function addItem(param1:String, param2:String, param3:BitmapData = null, param4:String = null) : int;
      
      function addOnlineNotification(param1:String, param2:String, param3:String = "") : void;
      
      function addOfflineNotification(param1:String, param2:String = "") : void;
      
      function addSongPlayingNotification(param1:String, param2:String) : void;
   }
}
