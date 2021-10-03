package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2612:int;
      
      private var var_2616:int;
      
      private var var_703:Boolean;
      
      private var var_2615:int;
      
      private var var_2617:int;
      
      private var var_2614:int;
      
      private var var_2613:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2612 = param1.readInteger();
         this.var_2616 = param1.readInteger();
         this.var_703 = param1.readBoolean();
         this.var_2615 = param1.readInteger();
         this.var_2617 = param1.readInteger();
         this.var_2614 = param1.readInteger();
         this.var_2613 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2612;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2616;
      }
      
      public function get online() : Boolean
      {
         return this.var_703;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2615;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2617;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2614;
      }
      
      public function get banCount() : int
      {
         return this.var_2613;
      }
   }
}
