package com.sulake.habbo.help.register
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class RegistrationView
   {
       
      
      private var var_17:IWindowContainer;
      
      private var _controller:RegistrationUI;
      
      private var var_37:IWindowContainer;
      
      public function RegistrationView(param1:RegistrationUI)
      {
         super();
         this._controller = param1;
      }
      
      public function showMainView() : void
      {
         if(!this.var_17)
         {
            this.var_17 = this.createWindow("registration_xml") as IWindowContainer;
            this.var_17.procedure = this.windowEventHandler;
         }
         this.positionMainWindowInTopRight();
         this.showView(this.var_17);
      }
      
      private function positionMainWindowInTopRight() : void
      {
         this.var_17.y = 0;
         this.var_17.x = this.var_17.parent.width - this.var_17.width;
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         if(this.var_37)
         {
            this.var_37.visible = false;
         }
         this.var_37 = param1;
         this.var_37.visible = true;
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = this._controller.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_)
         {
            return null;
         }
         return this._controller.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(param2.name == "registration_submit_button")
         {
            _loc3_ = this.var_37.findChildByName("registration_email_address") as ITextFieldWindow;
            _loc4_ = this.var_37.findChildByName("registration_new_password") as ITextFieldWindow;
            _loc5_ = this.var_37.findChildByName("registration_terms_checkbox") as ICheckBoxWindow;
            _loc6_ = this.var_37.findChildByName("registration_merketing_checkbox") as ICheckBoxWindow;
            _loc7_ = this.var_37.findChildByName("registration-email-address-error") as ITextWindow;
            _loc8_ = this.var_37.findChildByName("registration-new-password-error") as ITextWindow;
            _loc7_.text = "";
            _loc8_.text = "";
            _loc3_.color = 16777215;
            _loc4_.color = 16777215;
            _loc9_ = new Map();
            RegistrationValidator.validateRegistrationData(_loc3_.text,_loc4_.text,_loc5_.isSelected,_loc9_);
            if(_loc9_.length > 0)
            {
               for each(_loc10_ in _loc9_.getKeys())
               {
                  if(_loc10_ == "email")
                  {
                     _loc3_.color = 14309964;
                     _loc7_.text = _loc9_.getValue(_loc10_);
                  }
                  else if(_loc10_ == "password")
                  {
                     _loc4_.color = 14309964;
                     _loc8_.text = _loc9_.getValue(_loc10_);
                  }
                  else if(_loc10_ == "terms")
                  {
                  }
               }
            }
            else
            {
               this._controller.sendRegistrationEmail(_loc3_.text,_loc4_.text,_loc6_.isSelected);
               param2.visible = false;
               this.var_17.disable();
            }
         }
      }
      
      public function dispose() : void
      {
         this.var_37 = null;
         if(this.var_17 != null)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
      }
   }
}
