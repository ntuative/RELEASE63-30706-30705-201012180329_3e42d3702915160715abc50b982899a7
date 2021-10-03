package com.sulake.habbo.widget
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.widget.chooser.FurniChooserWidget;
   import com.sulake.habbo.widget.chooser.UserChooserWidget;
   import com.sulake.habbo.widget.doorbell.DoorbellWidget;
   import com.sulake.habbo.widget.friendrequest.FriendRequestWidget;
   import com.sulake.habbo.widget.furniture.clothingchange.ClothingChangeFurnitureWidget;
   import com.sulake.habbo.widget.furniture.credit.CreditFurniWidget;
   import com.sulake.habbo.widget.furniture.dimmer.DimmerFurniWidget;
   import com.sulake.habbo.widget.furniture.ecotronbox.EcotronBoxFurniWidget;
   import com.sulake.habbo.widget.furniture.placeholder.PlaceholderWidget;
   import com.sulake.habbo.widget.furniture.present.PresentFurniWidget;
   import com.sulake.habbo.widget.furniture.stickie.StickieFurniWidget;
   import com.sulake.habbo.widget.furniture.teaser.TeaserFurniWidget;
   import com.sulake.habbo.widget.furniture.trophy.TrophyFurniWidget;
   import com.sulake.habbo.widget.infostand.InfostandWidget;
   import com.sulake.habbo.widget.loadingbar.LoadingBarWidget;
   import com.sulake.habbo.widget.memenu.MeMenuWidget;
   import com.sulake.habbo.widget.poll.PollWidget;
   import com.sulake.habbo.widget.poll.VoteWidget;
   import com.sulake.habbo.widget.roomchat.RoomChatWidget;
   import com.sulake.habbo.widget.roomqueue.RoomQueueWidget;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import iid.IIDHabboWindowManager;
   
   public class RoomWidgetFactory extends Component implements IRoomWidgetFactory
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2652:IAssetLibrary;
      
      private var _localizations:IHabboLocalizationManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_2082:int = 0;
      
      public function RoomWidgetFactory(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_2652 = param1.root.assets;
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
      }
      
      override public function dispose() : void
      {
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._localizations)
         {
            this._localizations.release(new IIDHabboLocalizationManager());
            this._localizations = null;
         }
         if(this._habboConfiguration)
         {
            this._habboConfiguration.release(new IIDHabboConfigurationManager());
            this._habboConfiguration = null;
         }
         if(this._catalog)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localizations = param2 as IHabboLocalizationManager;
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._habboConfiguration = param2 as IHabboConfigurationManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      public function createWidget(param1:String) : IRoomWidget
      {
         var _loc2_:* = null;
         if(this._windowManager == null)
         {
            return null;
         }
         switch(param1)
         {
            case RoomWidgetEnum.const_366:
               _loc2_ = new RoomChatWidget(this._windowManager,assets,this._localizations,this._habboConfiguration,this.var_2082++,this);
               break;
            case RoomWidgetEnum.CHAT_INPUT_WIDGET:
               _loc2_ = new RoomChatInputWidget(this._windowManager,assets,this._localizations,this);
               break;
            case RoomWidgetEnum.const_413:
               _loc2_ = new InfostandWidget(this._windowManager,assets,this._localizations,this._habboConfiguration,this._catalog);
               break;
            case RoomWidgetEnum.const_538:
               _loc2_ = new MeMenuWidget(this._windowManager,assets,this._localizations,events,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_629:
               _loc2_ = new PlaceholderWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_475:
               _loc2_ = new CreditFurniWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_519:
               _loc2_ = new StickieFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_448:
               _loc2_ = new PresentFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_494:
               _loc2_ = new TrophyFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_453:
               _loc2_ = new TeaserFurniWidget(this._windowManager,assets,this._localizations,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_422:
               _loc2_ = new EcotronBoxFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_103:
               _loc2_ = new DoorbellWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_504:
               _loc2_ = new LoadingBarWidget(this._windowManager,assets,this._localizations,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_718:
               _loc2_ = new RoomQueueWidget(this._windowManager,assets,this._localizations,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_112:
               _loc2_ = new VoteWidget(this._windowManager,assets,this._localizations,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_335:
               _loc2_ = new PollWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_266:
               _loc2_ = new UserChooserWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_418:
               _loc2_ = new FurniChooserWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_397:
               _loc2_ = new DimmerFurniWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_134:
               _loc2_ = new FriendRequestWidget(this._windowManager,assets,this._localizations,this);
               break;
            case RoomWidgetEnum.const_406:
               _loc2_ = new ClothingChangeFurnitureWidget(this._windowManager,assets,this._localizations);
               break;
            case RoomWidgetEnum.const_744:
               _loc2_ = new RoomWidgetBase(this._windowManager);
         }
         return _loc2_;
      }
   }
}
