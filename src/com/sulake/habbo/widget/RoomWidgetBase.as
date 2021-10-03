package com.sulake.habbo.widget
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class RoomWidgetBase implements IRoomWidget
   {
       
      
      private var _events:EventDispatcher;
      
      private var var_138:IRoomWidgetMessageListener;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var _localizations:IHabboLocalizationManager;
      
      public function RoomWidgetBase(param1:IHabboWindowManager, param2:IAssetLibrary = null, param3:IHabboLocalizationManager = null)
      {
         super();
         this._windowManager = param1;
         this._assets = param2;
         this._localizations = param3;
      }
      
      public function get state() : int
      {
         return 0;
      }
      
      public function initialize(param1:int) : void
      {
      }
      
      public function dispose() : void
      {
         this.var_138 = null;
         this._windowManager = null;
         if(this._events != null && !this._events.disposed)
         {
            this.unregisterUpdateEvents(this._events);
         }
         this._events = null;
         this._assets = null;
         this._localizations = null;
      }
      
      public function set messageListener(param1:IRoomWidgetMessageListener) : void
      {
         this.var_138 = param1;
      }
      
      public function get messageListener() : IRoomWidgetMessageListener
      {
         return this.var_138;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this._assets;
      }
      
      public function get localizations() : IHabboLocalizationManager
      {
         return this._localizations;
      }
      
      public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 is EventDispatcher)
         {
            this._events = param1 as EventDispatcher;
         }
      }
      
      public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
      }
      
      public function get mainWindow() : IWindow
      {
         return null;
      }
   }
}
