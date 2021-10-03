package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_1973:int;
      
      private var var_1682:String;
      
      private var var_1975:String;
      
      private var var_1978:Boolean;
      
      private var var_1976:Boolean;
      
      private var var_1979:int;
      
      private var var_1977:String;
      
      private var var_1974:String;
      
      private var var_1683:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1973 = param1.readInteger();
         this.var_1682 = param1.readString();
         this.var_1975 = param1.readString();
         this.var_1978 = param1.readBoolean();
         this.var_1976 = param1.readBoolean();
         param1.readString();
         this.var_1979 = param1.readInteger();
         this.var_1977 = param1.readString();
         this.var_1974 = param1.readString();
         this.var_1683 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_1973;
      }
      
      public function get avatarName() : String
      {
         return this.var_1682;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1975;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_1978;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_1976;
      }
      
      public function get avatarGender() : int
      {
         return this.var_1979;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1977;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_1974;
      }
      
      public function get realName() : String
      {
         return this.var_1683;
      }
   }
}
