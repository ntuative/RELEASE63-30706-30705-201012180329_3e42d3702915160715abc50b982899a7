package com.sulake.habbo.moderation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class OpenUserInfo
   {
       
      
      private var _frame:IFrameWindow;
      
      private var var_45:ModerationManager;
      
      private var _userId:int;
      
      public function OpenUserInfo(param1:IFrameWindow, param2:ModerationManager, param3:IWindow, param4:int)
      {
         super();
         this._frame = param1;
         this.var_45 = param2;
         this._userId = param4;
         param3.procedure = this.onClick;
      }
      
      private function onClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new UserInfoFrameCtrl(this.var_45,this._userId),this._frame,false,false,true);
      }
   }
}
