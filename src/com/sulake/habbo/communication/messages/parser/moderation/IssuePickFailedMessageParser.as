package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IssuePickFailedMessageParser implements IMessageParser
   {
       
      
      private var _issues:Array;
      
      private var var_1961:Boolean;
      
      private var var_1962:int;
      
      public function IssuePickFailedMessageParser()
      {
         super();
      }
      
      public function get issues() : Array
      {
         return this._issues;
      }
      
      public function get retryEnabled() : Boolean
      {
         return this.var_1961;
      }
      
      public function get retryCount() : int
      {
         return this.var_1962;
      }
      
      public function flush() : Boolean
      {
         this._issues = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         this._issues = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            _loc6_ = param1.readString();
            _loc7_ = new IssueMessageData();
            _loc7_.issueId = _loc4_;
            _loc7_.pickerUserId = _loc5_;
            _loc7_.pickerUserName = _loc6_;
            this._issues.push(_loc7_);
            _loc3_++;
         }
         this.var_1961 = param1.readBoolean();
         this.var_1962 = param1.readInteger();
         return true;
      }
   }
}
