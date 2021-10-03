package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1297:int;
      
      private var var_274:String;
      
      private var var_1965:int;
      
      private var var_1966:int;
      
      private var var_1631:int;
      
      private var var_1964:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1297 = param1.readInteger();
         this.var_274 = param1.readString();
         this.var_1965 = param1.readInteger();
         this.var_1966 = param1.readInteger();
         this.var_1631 = param1.readInteger();
         this.var_1964 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_274;
      }
      
      public function get level() : int
      {
         return this.var_1297;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1965;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_1966;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1631;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1964;
      }
   }
}
