package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_108:String = "me_menu_top_view";
      
      public static const const_1451:String = "me_menu_rooms_view";
      
      public static const const_302:String = "me_menu_my_clothes_view";
      
      public static const const_999:String = "me_menu_dance_moves_view";
      
      public static const const_799:String = "me_menu_effects_view";
      
      public static const const_591:String = "me_menu_settings_view";
      
      public static const const_765:String = "me_menu_sound_settings";
       
      
      private var var_37:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_218:IEventDispatcher;
      
      private var _destinationSize:Point;
      
      private var var_779:Boolean = false;
      
      private var var_1312:int = 0;
      
      private var var_2317:int = 0;
      
      private var var_2316:int = 0;
      
      private var var_2314:Boolean = false;
      
      private var var_1646:int = 0;
      
      private var var_1050:Boolean = false;
      
      private var var_2315:Boolean = false;
      
      private var var_384:Boolean = false;
      
      private var var_2319:Number = 0;
      
      private var var_2318:Boolean = false;
      
      private var var_1644:int = 0;
      
      private var var_1645:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this._destinationSize = new Point(0,0);
         this.var_218 = param4;
         if(param5 != null && false)
         {
            this.var_2318 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         this.changeView(const_108);
         this.hide();
      }
      
      override public function dispose() : void
      {
         this.hide();
         this.var_218 = null;
         if(this.var_37 != null)
         {
            this.var_37.dispose();
            this.var_37 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_582,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_787,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_585,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_749,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_348,this.onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_798,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_673,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_201,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_247,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_738,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_203,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_339,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_113,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_429,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_168,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_102,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_965,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_582,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_787,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_585,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_749,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_348,this.onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_201,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_247,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_738,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_798,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_673,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_203,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_339,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_429,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_113,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_168,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_102,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_102,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_717);
         _loc2_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(this.var_37 != null)
         {
            this._mainContainer.removeChild(this.var_37.window);
            this.var_37.dispose();
            this.var_37 = null;
         }
         this.var_384 = false;
         this.var_218.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_108);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_567);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_384 = true;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_384 && this.var_37.window.name == const_302))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_677);
            if(messageListener != null)
            {
               if(!this.var_1645)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_384)
         {
            return;
         }
         if(this.var_37.window.name == const_765)
         {
            (this.var_37 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_429:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_384 + " view: " + this.var_37.window.name);
               if(this.var_384 != true || this.var_37.window.name != const_108)
               {
                  return;
               }
               (this.var_37 as MeMenuMainView).setIconAssets("clothes_icon",const_108,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_113:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_384 = !this.var_384;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_384 = false;
               break;
            default:
               return;
         }
         if(this.var_384)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1050 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1050 = true;
            }
         }
         if(this.var_37 != null && this.var_37.window.name == const_799)
         {
            (this.var_37 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_37 != null && this.var_37.window.name != const_302)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_37 != null && this.var_37.window.name == const_302)
         {
            this.changeView(const_108);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_37 != null && this.var_37.window.name == const_302)
         {
            this.changeView(const_108);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1312;
         this.var_1312 = param1.daysLeft;
         this.var_2317 = param1.periodsLeft;
         this.var_2316 = param1.pastPeriods;
         this.var_2314 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1646);
         this.var_1646 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_37 != null)
            {
               this.changeView(this.var_37.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1050 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1050 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1644 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1644.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1645 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1645 = true;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!this.var_779)
         {
            return;
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1301,HabboWindowStyle.const_960,HabboWindowParam.const_37,new Rectangle(0,0,170,260)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_me_menu");
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_108:
               _loc2_ = new MeMenuMainView();
               this.var_218.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_799:
               _loc2_ = new MeMenuEffectsView();
               this.var_218.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_999:
               _loc2_ = new MeMenuDanceView();
               this.var_218.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_302:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1451:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_591:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_765:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_37 != null)
            {
               this._mainContainer.removeChild(this.var_37.window);
               this.var_37.dispose();
               this.var_37 = null;
            }
            this.var_37 = _loc2_;
            this.var_37.init(this,param1);
         }
         this.updateSize();
      }
      
      public function updateSize() : void
      {
         if(this.var_37 != null)
         {
            this._destinationSize.x = this.var_37.window.width + 10;
            this._destinationSize.y = this.var_37.window.height;
            this.var_37.window.x = 5;
            this.var_37.window.y = 0;
            this._mainContainer.width = this._destinationSize.x;
            this._mainContainer.height = this._destinationSize.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2314;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1312 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1312;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2317;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2316;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1646;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2318;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1644;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2319 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - this.var_2319 > 5000;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1050;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2315;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2315 = param1;
      }
   }
}
