package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2074:String;
      
      private var var_1994:int;
      
      private var var_2075:int;
      
      private var var_1995:String;
      
      private var var_2073:int;
      
      private var var_1681:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2074 = param1.readString();
         this.var_1994 = param1.readInteger();
         this.var_2075 = param1.readInteger();
         this.var_1995 = param1.readString();
         this.var_2073 = param1.readInteger();
         this.var_1681 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2074;
      }
      
      public function get unitPort() : int
      {
         return this.var_1994;
      }
      
      public function get worldId() : int
      {
         return this.var_2075;
      }
      
      public function get castLibs() : String
      {
         return this.var_1995;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2073;
      }
      
      public function get nodeId() : int
      {
         return this.var_1681;
      }
   }
}
