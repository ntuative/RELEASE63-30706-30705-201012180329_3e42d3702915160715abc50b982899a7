package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SetObjectDataMessageComposer implements IMessageComposer
   {
       
      
      private var var_312:int;
      
      private var _data:String = "";
      
      private var _roomId:int;
      
      private var _roomCategory:int = 0;
      
      public function SetObjectDataMessageComposer(param1:int, param2:String, param3:int = 0, param4:int = 0)
      {
         super();
         this.var_312 = param1;
         this._data = param2;
         this._roomId = param3;
         this._roomCategory = param4;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [String(this.var_312),this._data];
      }
   }
}
