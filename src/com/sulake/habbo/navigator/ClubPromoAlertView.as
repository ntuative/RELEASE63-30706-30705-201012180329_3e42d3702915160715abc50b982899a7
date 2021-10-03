package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class ClubPromoAlertView extends AlertView
   {
       
      
      private var _text:String;
      
      private var _promoText:String;
      
      public function ClubPromoAlertView(param1:HabboNavigator, param2:String, param3:String, param4:String)
      {
         super(param1,"nav_promo_alert",param2);
         this._text = param3;
         this._promoText = param4;
      }
      
      override function setupContent(param1:IWindowContainer) : void
      {
         param1.findChildByName("body_text").caption = this._text;
         param1.findChildByName("promo_text").caption = this._promoText;
         param1.findChildByName("ok").procedure = this.onOk;
         param1.findChildByName("promo_container").procedure = this.onPromo;
      }
      
      private function onOk(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onPromo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         navigator.openCatalogClubPage();
         dispose();
      }
   }
}
