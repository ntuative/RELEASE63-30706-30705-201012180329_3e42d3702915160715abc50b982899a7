package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_60:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function get issueData() : IssueMessageData
      {
         return this.var_60;
      }
      
      public function flush() : Boolean
      {
         this.var_60 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_60 = new IssueMessageData();
         this.var_60.issueId = param1.readInteger();
         this.var_60.state = param1.readInteger();
         this.var_60.categoryId = param1.readInteger();
         this.var_60.reportedCategoryId = param1.readInteger();
         this.var_60.timeStamp = getTimer() - param1.readInteger();
         this.var_60.priority = param1.readInteger();
         this.var_60.reporterUserId = param1.readInteger();
         this.var_60.reporterUserName = param1.readString();
         this.var_60.reportedUserId = param1.readInteger();
         this.var_60.reportedUserName = param1.readString();
         this.var_60.pickerUserId = param1.readInteger();
         this.var_60.pickerUserName = param1.readString();
         this.var_60.message = param1.readString();
         this.var_60.chatRecordId = param1.readInteger();
         this.var_60.roomName = param1.readString();
         this.var_60.roomType = param1.readInteger();
         if(this.var_60.roomType == 0)
         {
            this.var_60.roomResources = param1.readString();
            this.var_60.unitPort = param1.readInteger();
            this.var_60.worldId = param1.readInteger();
         }
         if(this.var_60.roomType == 1)
         {
            this.var_60.flatType = param1.readString();
            this.var_60.flatId = param1.readInteger();
            this.var_60.flatOwnerName = param1.readString();
         }
         return true;
      }
   }
}
