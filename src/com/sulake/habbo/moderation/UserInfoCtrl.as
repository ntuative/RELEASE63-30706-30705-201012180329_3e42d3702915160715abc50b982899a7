package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorUserInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetUserChatlogMessageComposer;
   
   public class UserInfoCtrl implements IDisposable
   {
      
      private static const const_830:int = 60;
      
      private static const const_829:int = 3600;
      
      private static const const_832:int = 86400;
      
      private static const const_831:int = 31536000;
       
      
      private var _callerFrame:IFrameWindow;
      
      private var var_45:ModerationManager;
      
      private var _userId:int;
      
      private var var_1336:String;
      
      private var _data:ModeratorUserInfoData;
      
      private var var_997:IWindowContainer;
      
      private var var_996:Boolean;
      
      private var _disposed:Boolean;
      
      public function UserInfoCtrl(param1:IFrameWindow, param2:ModerationManager, param3:String, param4:Boolean = false)
      {
         super();
         this._callerFrame = param1;
         this.var_45 = param2;
         this.var_1336 = param3;
         this.var_996 = param4;
      }
      
      public static function formatTime(param1:int) : String
      {
         if(param1 < 2 * const_830)
         {
            return param1 + " secs ago";
         }
         if(param1 < 2 * const_829)
         {
            return Math.round(param1 / const_830) + " mins ago";
         }
         if(param1 < 2 * const_832)
         {
            return Math.round(param1 / const_829) + " hours ago";
         }
         if(param1 < 2 * const_831)
         {
            return Math.round(param1 / const_832) + " days ago";
         }
         return Math.round(param1 / const_831) + " years ago";
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function load(param1:IWindowContainer, param2:int) : void
      {
         this.var_997 = param1;
         this._userId = param2;
         this._data = null;
         this.refresh();
         this.var_45.messageHandler.addUserInfoListener(this);
         this.var_45.connection.send(new GetModeratorUserInfoMessageComposer(param2));
      }
      
      public function onUserInfo(param1:ModeratorUserInfoData) : void
      {
         if(param1.userId != this._userId)
         {
            return;
         }
         this._data = param1;
         this.refresh();
      }
      
      public function refresh() : void
      {
         if(this.var_997.disposed)
         {
            return;
         }
         var _loc1_:IWindowContainer = this.prepare();
         if(this._data == null)
         {
            _loc1_.findChildByName("fields").visible = false;
            _loc1_.findChildByName("loading_txt").visible = true;
            return;
         }
         _loc1_.findChildByName("fields").visible = true;
         _loc1_.findChildByName("loading_txt").visible = false;
         this.setTxt(_loc1_,"name_txt",this._data.userName);
         this.setTxt(_loc1_,"cfh_count_txt","" + this._data.cfhCount);
         this.setAlertTxt(_loc1_,"abusive_cfh_count_txt",this._data.abusiveCfhCount,false);
         this.setAlertTxt(_loc1_,"caution_count_txt",this._data.cautionCount,true);
         this.setAlertTxt(_loc1_,"ban_count_txt",this._data.banCount,true);
         this.setTxt(_loc1_,"registered_txt",formatTime(this._data.minutesSinceRegistration * 60));
         this.setTxt(_loc1_,"last_login_txt",formatTime(this._data.minutesSinceLastLogin * 60));
         this.setTxt(_loc1_,"online_txt",!!this._data.online ? "Yes" : "No");
         Logger.log("USER: " + this._data.userName + ", " + this._data.banCount + ", " + this._data.cautionCount);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_45.messageHandler.removeUserInfoListener(this);
         this._callerFrame = null;
         this.var_45 = null;
         this._data = null;
         this.var_997 = null;
      }
      
      private function prepare() : IWindowContainer
      {
         var _loc1_:IWindowContainer = IWindowContainer(this.var_997.findChildByName("user_info"));
         if(_loc1_ == null)
         {
            _loc1_ = IWindowContainer(this.var_45.getXmlWindow("user_info"));
            this.var_997.addChild(_loc1_);
            this.var_45.disableButton(this.var_45.initMsg.chatlogsPermission,_loc1_,"chatlog_but");
            this.var_45.disableButton(this.var_45.initMsg.alertPermission,_loc1_,"message_but");
            this.var_45.disableButton(this.var_45.initMsg.alertPermission || this.var_45.initMsg.kickPermission || this.var_45.initMsg.banPermission,_loc1_,"modaction_but");
         }
         _loc1_.findChildByName("chatlog_but").procedure = this.onChatlogButton;
         _loc1_.findChildByName("roomvisits_but").procedure = this.onRoomVisitsButton;
         _loc1_.findChildByName("habboinfotool_but").procedure = this.onHabboInfoToolButton;
         _loc1_.findChildByName("message_but").procedure = this.onMessageButton;
         _loc1_.findChildByName("modaction_but").procedure = this.onModActionButton;
         _loc1_.findChildByName("view_caution_count_txt").procedure = this.onViewCautions;
         _loc1_.findChildByName("view_ban_count_txt").procedure = this.onViewBans;
         return _loc1_;
      }
      
      private function setAlertTxt(param1:IWindowContainer, param2:String, param3:int, param4:Boolean) : void
      {
         var _loc5_:ITextWindow = ITextWindow(param1.findChildByName(param2));
         var _loc6_:ITextWindow = ITextWindow(param1.findChildByName("view_" + param2));
         if(_loc6_ != null)
         {
            _loc6_.visible = param3 > 0;
         }
         _loc5_.visible = param3 > 0;
         _loc5_.text = "" + param3;
      }
      
      private function setTxt(param1:IWindowContainer, param2:String, param3:String) : void
      {
         var _loc4_:ITextWindow = ITextWindow(param1.findChildByName(param2));
         _loc4_.text = param3;
      }
      
      private function onChatlogButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new ChatlogCtrl(new GetUserChatlogMessageComposer(this._data.userId),this.var_45,WindowTracker.const_907,this._data.userId),this._callerFrame,this.var_996,false,true);
      }
      
      private function onRoomVisitsButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new RoomVisitsCtrl(this.var_45,this._data.userId),this._callerFrame,this.var_996,false,true);
      }
      
      private function onHabboInfoToolButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.openHkPage("habboinfotool.url",this._data.userName);
      }
      
      private function onMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new SendMsgsCtrl(this.var_45,this._data.userId,this._data.userName,this.var_1336),this._callerFrame,this.var_996,false,true);
      }
      
      private function onModActionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new ModActionCtrl(this.var_45,this._data.userId,this._data.userName,this.var_1336),this._callerFrame,this.var_996,false,true);
      }
      
      private function onViewCautions(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.showModeratorLog();
      }
      
      private function onViewBans(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.showModeratorLog();
      }
      
      private function showModeratorLog() : void
      {
         this.var_45.openHkPage("moderatoractionlog.url",this._data.userName);
      }
   }
}
