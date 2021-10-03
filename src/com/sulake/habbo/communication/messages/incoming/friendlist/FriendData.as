package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_854:int;
      
      private var var_703:Boolean;
      
      private var var_1659:Boolean;
      
      private var var_568:String;
      
      private var var_1241:int;
      
      private var var_1785:String;
      
      private var var_1684:String;
      
      private var var_1683:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_854 = param1.readInteger();
         this.var_703 = param1.readBoolean();
         this.var_1659 = param1.readBoolean();
         this.var_568 = param1.readString();
         this.var_1241 = param1.readInteger();
         this.var_1785 = param1.readString();
         this.var_1684 = param1.readString();
         this.var_1683 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_854;
      }
      
      public function get online() : Boolean
      {
         return this.var_703;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1659;
      }
      
      public function get figure() : String
      {
         return this.var_568;
      }
      
      public function get categoryId() : int
      {
         return this.var_1241;
      }
      
      public function get motto() : String
      {
         return this.var_1785;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1684;
      }
      
      public function get realName() : String
      {
         return this.var_1683;
      }
   }
}
