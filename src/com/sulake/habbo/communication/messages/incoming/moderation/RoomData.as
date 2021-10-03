package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomData implements IDisposable
   {
       
      
      private var var_982:Boolean;
      
      private var _name:String;
      
      private var _desc:String;
      
      private var var_771:Array;
      
      private var _disposed:Boolean;
      
      public function RoomData(param1:IMessageDataWrapper)
      {
         this.var_771 = new Array();
         super();
         this.var_982 = param1.readBoolean();
         if(!this.exists)
         {
            return;
         }
         this._name = param1.readString();
         this._desc = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_771.push(param1.readString());
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_771 = null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get tags() : Array
      {
         return this.var_771;
      }
      
      public function get exists() : Boolean
      {
         return this.var_982;
      }
   }
}
