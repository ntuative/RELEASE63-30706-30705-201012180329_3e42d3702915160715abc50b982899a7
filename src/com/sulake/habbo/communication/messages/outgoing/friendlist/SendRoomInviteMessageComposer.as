package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_862:Array;
      
      private var var_1731:String;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         this.var_862 = new Array();
         super();
         this.var_1731 = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_862.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_862.length)
         {
            _loc1_.push(this.var_862[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1731);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_862.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_862 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
