package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1610:int = 1;
      
      public static const const_1487:int = 2;
       
      
      private var var_881:String;
      
      private var var_2544:int;
      
      private var var_2546:int;
      
      private var var_2545:int;
      
      private var var_2542:int;
      
      private var var_2540:Boolean;
      
      private var var_2061:Boolean;
      
      private var var_2301:int;
      
      private var var_2302:int;
      
      private var var_2541:Boolean;
      
      private var var_2539:int;
      
      private var var_2543:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_881 = param1.readString();
         this.var_2544 = param1.readInteger();
         this.var_2546 = param1.readInteger();
         this.var_2545 = param1.readInteger();
         this.var_2542 = param1.readInteger();
         this.var_2540 = param1.readBoolean();
         this.var_2061 = param1.readBoolean();
         this.var_2301 = param1.readInteger();
         this.var_2302 = param1.readInteger();
         this.var_2541 = param1.readBoolean();
         this.var_2539 = param1.readInteger();
         this.var_2543 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_881;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2544;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2546;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2545;
      }
      
      public function get responseType() : int
      {
         return this.var_2542;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2540;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2061;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2301;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2302;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2541;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2539;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2543;
      }
   }
}
