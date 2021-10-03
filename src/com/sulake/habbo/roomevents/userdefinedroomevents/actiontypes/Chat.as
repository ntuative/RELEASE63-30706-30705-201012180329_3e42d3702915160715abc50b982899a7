package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   
   public class Chat implements ActionType
   {
       
      
      public function Chat()
      {
         super();
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_1866;
      }
      
      public function get allowDelaying() : Boolean
      {
         return false;
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function readIntParamsFromForm(param1:IWindowContainer) : Array
      {
         return new Array();
      }
      
      public function readStringParamFromForm(param1:IWindowContainer) : String
      {
         return this.getInput(param1).text;
      }
      
      public function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void
      {
      }
      
      public function onEditStart(param1:IWindowContainer, param2:Triggerable) : void
      {
         this.getInput(param1).text = param2.stringParam;
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      private function getInput(param1:IWindowContainer) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("chat_message"));
      }
   }
}
