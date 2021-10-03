package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private const const_1561:String = "infostand_user_view";
      
      private const const_1560:String = "infostand_furni_view";
      
      private const const_1563:String = "infostand_pet_view";
      
      private const const_1562:String = "infostand_bot_view";
      
      private var var_1046:InfoStandFurniView;
      
      private var var_159:InfoStandUserView;
      
      private var var_322:InfoStandPetView;
      
      private var var_383:InfoStandBotView;
      
      private var var_2299:Array;
      
      private var var_1307:InfostandUserData;
      
      private var var_442:InfostandFurniData;
      
      private var var_1359:InfoStandPetData;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_140:Timer;
      
      private var _config:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private const const_1839:int = 3000;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_1046 = new InfoStandFurniView(this,this.const_1560,this._catalog);
         this.var_159 = new InfoStandUserView(this,this.const_1561);
         this.var_322 = new InfoStandPetView(this,this.const_1563);
         this.var_383 = new InfoStandBotView(this,this.const_1562);
         this.var_1307 = new InfostandUserData();
         this.var_442 = new InfostandFurniData();
         this.var_1359 = new InfoStandPetData();
         this.var_140 = new Timer(this.const_1839);
         this.var_140.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_55,HabboWindowStyle.const_37,HabboWindowParam.const_37,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
      }
      
      override public function dispose() : void
      {
         if(this.var_140)
         {
            this.var_140.stop();
         }
         this.var_140 = null;
         if(this.var_159)
         {
            this.var_159.dispose();
         }
         this.var_159 = null;
         if(this.var_1046)
         {
            this.var_1046.dispose();
         }
         this.var_1046 = null;
         if(this.var_383)
         {
            this.var_383.dispose();
         }
         this.var_383 = null;
         if(this.var_322)
         {
            this.var_322.dispose();
         }
         this.var_322 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_331,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_201,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_296,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_130,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_203,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_257,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_776,this.method_6);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_143,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_150,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_140,this.onUserBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_705,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_331,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_201,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_296,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_130,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_203,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_257,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_776,this.method_6);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_143,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_150,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_140,this.onUserBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_705,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_1307;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_442;
      }
      
      public function get petData() : InfoStandPetData
      {
         return this.var_1359;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_322 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_314,this.var_322.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_159.update(param1);
         this.selectView(this.const_1561);
         if(this.var_140)
         {
            this.var_140.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_383.update(param1);
         this.selectView(this.const_1562);
         if(this.var_140)
         {
            this.var_140.stop();
         }
      }
      
      private function method_6(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         this.var_1046.update(param1);
         this.selectView(this.const_1560);
         if(this.var_140)
         {
            this.var_140.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_322.update(this.petData);
         this.selectView(this.const_1563);
         if(this.var_140)
         {
            this.var_140.start();
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_322.updateEnabledTrainingCommands(param1.id,param1.enabledCommands);
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2299 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_159.setTags(param1.tags);
         }
         else
         {
            this.var_159.setTags(param1.tags,this.var_2299);
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(!param1.isOwnUser)
         {
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_383.image = param1.image;
         }
         else
         {
            this.var_159.image = param1.image;
            this.var_159.motto = param1.customInfo;
            this.var_159.achievementScore = param1.achievementScore;
         }
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_159.clearBadges();
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_383.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_159.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_159.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_376,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_130:
               _loc2_ = param1.id == this.var_442.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_296:
               if(this.var_159 != null && this.var_159.window != null && this.var_159.window.visible)
               {
                  _loc2_ = param1.id == this.var_1307.userRoomId;
                  break;
               }
               if(this.var_322 != null && this.var_322.window != null && this.var_322.window.visible)
               {
                  _loc2_ = param1.id == this.var_1359.roomIndex;
                  break;
               }
               if(this.var_383 != null && this.var_383.window != null && this.var_383.window.visible)
               {
                  _loc2_ = param1.id == this.var_1307.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_140)
         {
            this.var_140.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_140)
         {
            this.var_140.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
   }
}
