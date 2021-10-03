package com.sulake.habbo.widget.furniture.teaser
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetTeaserDataUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetConversionPointMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetViralFurniMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class TeaserFurniWidget extends RoomWidgetBase
   {
       
      
      private var _localizations:IHabboLocalizationManager;
      
      private var _assets:IAssetLibrary;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var _window:IFrameWindow;
      
      private var var_1257:int = -1;
      
      private var _status:int = -1;
      
      private var var_1256:String;
      
      private var var_312:int = -1;
      
      private const const_1549:int = 0;
      
      private const const_1550:int = 1;
      
      private const const_1552:int = 2;
      
      private const const_1551:int = 3;
      
      private const const_1829:int = 0;
      
      private const const_1830:int = 1;
      
      private const const_1827:int = 2;
      
      private const const_1828:String = "xmas10_dialog_bg_png";
      
      private const const_1553:String = "xmas10_dialog_telepair_png";
      
      private const const_1162:String = "xmas10_present_dialog_img_png";
      
      private const const_1826:String = "xmas10_dialog_newbiegift_png";
      
      public function TeaserFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager)
      {
         super(param1,param2);
         this._assets = param2;
         this._localizations = param3;
         this._habboConfiguration = param4;
      }
      
      override public function dispose() : void
      {
         this.hideInterface();
         this._assets = null;
         this._localizations = null;
         this._habboConfiguration = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_508,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_784,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_761,this.onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetTeaserDataUpdateEvent.const_508,this.onObjectUpdate);
      }
      
      private function onObjectUpdate(param1:RoomWidgetTeaserDataUpdateEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomWidgetTeaserDataUpdateEvent.const_508:
               _loc2_ = this.const_1549;
               this.var_1256 = null;
               break;
            case RoomWidgetTeaserDataUpdateEvent.const_761:
               _loc3_ = param1.firstClickUserName;
               if(_loc3_ && _loc3_ != "")
               {
                  _loc2_ = this.const_1551;
                  this._localizations.registerParameter("widget.furni.teaser.notify.unlocked.desc","username",_loc3_);
               }
               else
               {
                  _loc2_ = this.const_1552;
               }
               this.var_1256 = null;
               break;
            case RoomWidgetTeaserDataUpdateEvent.const_784:
               _loc2_ = this.const_1550;
               this.var_312 = param1.objectId;
               this.var_1256 = param1.data;
               this._status = param1.status;
               this._localizations.registerParameter("notifications.viral_furni.fb.title","realname",param1.ownRealName);
               this._localizations.registerParameter("notifications.viral_furni.fb.desc","realname",param1.ownRealName);
               this._localizations.registerParameter("widget.furni.teaser.gift.unlocked.desc","username",param1.firstClickUserName);
               break;
            default:
               Logger.log("Error, invalid viral widget update message: " + param1.type);
         }
         if(this.var_1257 != _loc2_ && this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_1257 = _loc2_;
         this.mainWindow;
         this.showInterface();
      }
      
      override public function get mainWindow() : IWindow
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_1257 == -1)
         {
            return null;
         }
         if(!this._window)
         {
            switch(this.var_1257)
            {
               case this.const_1549:
                  _loc1_ = assets.getAssetByName("notification_teaser") as XmlAsset;
                  _loc2_ = this.const_1162;
                  this.sendConversionPoint("xmas10viral","client.show.teaser");
                  break;
               case this.const_1550:
                  if(this._status == this.const_1829)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_locked") as XmlAsset;
                     this.sendConversionPoint("xmas10viral","client.show.locked");
                     _loc2_ = this.const_1162;
                  }
                  else if(this._status == this.const_1830)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_unlocked") as XmlAsset;
                     this.sendConversionPoint("xmas10viral","client.show.unlocked");
                     _loc2_ = this.const_1553;
                  }
                  else if(this._status == this.const_1827)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_no_fb") as XmlAsset;
                     this.sendConversionPoint("xmas10viral","client.show.no_fb");
                     _loc2_ = this.const_1553;
                  }
                  break;
               case this.const_1552:
                  _loc1_ = assets.getAssetByName("notification_gift_received") as XmlAsset;
                  _loc2_ = this.const_1826;
                  break;
               case this.const_1551:
                  _loc1_ = assets.getAssetByName("notification_gift_unlocked_notify") as XmlAsset;
                  _loc2_ = this.const_1162;
            }
            if(_loc1_ == null)
            {
               return null;
            }
            this._window = windowManager.buildFromXML(_loc1_.content as XML) as IFrameWindow;
            this._window.header.controls.visible = false;
            this._window.center();
            this._window.visible = false;
            _loc4_ = this._window.findChildByName("xmas10_dialog_bg") as IBitmapWrapperWindow;
            if(_loc4_)
            {
               _loc3_ = (assets.getAssetByName(this.const_1828) as BitmapDataAsset).content as BitmapData;
               _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,0);
               _loc4_.bitmap.copyPixels(_loc3_,_loc3_.rect,new Point(0,_loc4_.height - _loc3_.height),null,null,true);
            }
            _loc4_ = this._window.findChildByName("deco_img") as IBitmapWrapperWindow;
            if(_loc4_)
            {
               _loc3_ = (assets.getAssetByName(_loc2_) as BitmapDataAsset).content as BitmapData;
               _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,0);
               _loc4_.bitmap.copyPixels(_loc3_,_loc3_.rect,new Point(0,_loc4_.height - _loc3_.height),null,null,true);
            }
            _loc5_ = this._window.findChildByName("teaser_ok_btn");
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onTeaserOkButton);
            }
            _loc5_ = this._window.findChildByName("no_fb_btn");
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onNoFbButton);
            }
            _loc5_ = this._window.findChildByName("received_ok_btn");
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onReceivedOkButton);
            }
            _loc5_ = this._window.findChildByName("skip_btn");
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onSkipButton);
            }
            _loc5_ = this._window.findChildByName("post_btn");
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPostButton);
            }
            _loc5_ = this._window.findChildByName("open_btn");
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onOpenButton);
            }
         }
         return this._window;
      }
      
      private function showInterface() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = true;
      }
      
      private function hideInterface() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function onNoFbButton(param1:WindowEvent) : void
      {
         this.hideInterface();
      }
      
      private function onTeaserOkButton(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(messageListener != null)
         {
            _loc2_ = new RoomWidgetViralFurniMessage(RoomWidgetViralFurniMessage.const_654);
            messageListener.processWidgetMessage(_loc2_);
         }
         this.hideInterface();
      }
      
      private function onReceivedOkButton(param1:WindowEvent) : void
      {
         this.hideInterface();
      }
      
      private function onSkipButton(param1:WindowEvent) : void
      {
         this.sendConversionPoint("xmas10viral","client.skip_post");
         this.hideInterface();
      }
      
      private function onPostButton(param1:WindowEvent) : void
      {
         var _loc2_:String = this._localizations.getKey("notifications.viral_furni.fb.title");
         var _loc3_:String = this._localizations.getKey("notifications.viral_furni.fb.desc");
         this.sendConversionPoint("xmas10viral","client.start_post");
         var _loc4_:String = this._habboConfiguration.getKey("viral.furni.post_type","feed");
         HabboWebTools.facebookViralGiftPost(_loc2_,_loc3_,this.var_1256,_loc4_);
         this.hideInterface();
      }
      
      private function onOpenButton(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(messageListener != null)
         {
            _loc2_ = new RoomWidgetViralFurniMessage(RoomWidgetViralFurniMessage.const_154);
            _loc2_.objectId = this.var_312;
            messageListener.processWidgetMessage(_loc2_);
         }
         this.hideInterface();
         this.sendConversionPoint("xmas10viral","client.open_gift");
      }
      
      private function sendConversionPoint(param1:String, param2:String, param3:String = "") : void
      {
         var _loc4_:* = null;
         if(messageListener != null)
         {
            _loc4_ = new RoomWidgetConversionPointMessage(RoomWidgetConversionPointMessage.const_590,"ViralGift",param1,param2,param3);
            messageListener.processWidgetMessage(_loc4_);
         }
      }
   }
}
