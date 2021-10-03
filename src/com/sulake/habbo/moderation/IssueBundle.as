package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   
   public class IssueBundle
   {
       
      
      private var _id:int;
      
      private var _issues:Map;
      
      private var _state:int;
      
      private var var_2106:int = 0;
      
      private var var_2460:String = "";
      
      private var var_1253:int;
      
      public function IssueBundle(param1:int, param2:IssueMessageData)
      {
         super();
         this._id = param1;
         this._issues = new Map();
         this._issues.add(param2.issueId,param2);
         this._state = param2.state;
         this.var_2106 = param2.pickerUserId;
         this.var_2460 = param2.pickerUserName;
         this.var_1253 = param2.reportedUserId;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get issues() : Array
      {
         return this._issues.getValues();
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2106;
      }
      
      public function get pickerName() : String
      {
         return this.var_2460;
      }
      
      public function updateIssue(param1:IssueMessageData) : void
      {
         this._issues.remove(param1.issueId);
         this._issues.add(param1.issueId,param1);
      }
      
      public function removeIssue(param1:int) : IssueMessageData
      {
         return this._issues.remove(param1) as IssueMessageData;
      }
      
      public function getPrioritySum() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.issues)
         {
            _loc1_ += _loc2_.priority;
         }
         return _loc1_;
      }
      
      public function getHighestPriorityIssue() : IssueMessageData
      {
         var _loc2_:* = null;
         if(this._issues == null || this._issues.length < 1)
         {
            return null;
         }
         var _loc1_:IssueMessageData = this._issues.getWithIndex(0);
         var _loc3_:int = 1;
         while(_loc3_ < this._issues.length)
         {
            _loc2_ = this._issues.getWithIndex(_loc3_);
            if(_loc2_ != null && _loc2_.priority > _loc1_.priority)
            {
               _loc1_ = _loc2_;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getIssueCount() : int
      {
         if(this._issues == null)
         {
            return 0;
         }
         return this._issues.length;
      }
      
      public function getIssueIds() : Array
      {
         if(this._issues == null)
         {
            return [];
         }
         return this._issues.getKeys();
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1253;
      }
      
      public function getMessageCount() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this._issues)
         {
            if(_loc2_.message != "")
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc2_ in this._issues)
         {
            if(_loc1_ == null || _loc2_.timeStamp < _loc1_.timeStamp)
            {
               _loc1_ = _loc2_;
            }
         }
         if(_loc1_ != null)
         {
            return _loc1_.getOpenTime();
         }
         return "";
      }
   }
}
