package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_483:int = 0;
       
      
      private var var_2303:int = 0;
      
      private var var_1308:Dictionary;
      
      private var var_1642:int = 0;
      
      private var var_1643:int = 0;
      
      private var var_2061:Boolean = false;
      
      private var var_2301:int = 0;
      
      private var var_2302:int = 0;
      
      public function Purse()
      {
         this.var_1308 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2303;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2303 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1642;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1642 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1643;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1643 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1642 > 0 || this.var_1643 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2061;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2061 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2301;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2301 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2302;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2302 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1308;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1308 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1308[param1];
      }
   }
}
