package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1297:int;
      
      private var var_1675:int;
      
      private var var_1966:int;
      
      private var var_1631:int;
      
      private var var_1296:int;
      
      private var var_2264:String = "";
      
      private var var_2427:String = "";
      
      private var var_2428:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1297 = param1.readInteger();
         this.var_2264 = param1.readString();
         this.var_1675 = param1.readInteger();
         this.var_1966 = param1.readInteger();
         this.var_1631 = param1.readInteger();
         this.var_1296 = param1.readInteger();
         this.var_2428 = param1.readInteger();
         this.var_2427 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1297;
      }
      
      public function get points() : int
      {
         return this.var_1675;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_1966;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1631;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1296;
      }
      
      public function get badgeID() : String
      {
         return this.var_2264;
      }
      
      public function get achievementID() : int
      {
         return this.var_2428;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2427;
      }
   }
}
