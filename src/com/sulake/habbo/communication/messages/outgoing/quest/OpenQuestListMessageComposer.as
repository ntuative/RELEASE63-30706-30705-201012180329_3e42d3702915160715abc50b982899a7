package com.sulake.habbo.communication.messages.outgoing.quest
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenQuestListMessageComposer implements IMessageComposer
   {
       
      
      private var _data:Array;
      
      public function OpenQuestListMessageComposer()
      {
         this._data = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         return this._data;
      }
      
      public function dispose() : void
      {
         this._data = null;
      }
   }
}
