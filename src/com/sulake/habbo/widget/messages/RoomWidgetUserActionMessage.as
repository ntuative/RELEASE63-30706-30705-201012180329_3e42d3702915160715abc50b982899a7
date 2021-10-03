package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_816:String = "RWUAM_WHISPER_USER";
      
      public static const const_630:String = "RWUAM_IGNORE_USER";
      
      public static const const_698:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_442:String = "RWUAM_KICK_USER";
      
      public static const const_766:String = "RWUAM_BAN_USER";
      
      public static const const_789:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_605:String = "RWUAM_RESPECT_USER";
      
      public static const const_746:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_573:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_609:String = "RWUAM_START_TRADING";
      
      public static const const_703:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_407:String = "RWUAM_KICK_BOT";
      
      public static const const_706:String = "RWUAM_REPORT";
      
      public static const const_412:String = "RWUAM_PICKUP_PET";
      
      public static const const_1490:String = "RWUAM_TRAIN_PET";
      
      public static const const_451:String = " RWUAM_RESPECT_PET";
      
      public static const const_314:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
