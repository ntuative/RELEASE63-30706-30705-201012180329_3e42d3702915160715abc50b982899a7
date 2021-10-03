package com.sulake.habbo.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.notifications.ActivityPointsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestAcceptedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestCompletedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestListMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.QuestAcceptedMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestCompletedMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestListMessageParser;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   
   public class IncomingMessages
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      public function IncomingMessages(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         var _loc2_:IHabboCommunicationManager = this._questEngine.communication;
         _loc2_.addHabboConnectionMessageEvent(new QuestListMessageEvent(this.onQuestList));
         _loc2_.addHabboConnectionMessageEvent(new QuestAcceptedMessageEvent(this.onQuestAccepted));
         _loc2_.addHabboConnectionMessageEvent(new QuestCompletedMessageEvent(this.onQuestCompleted));
         _loc2_.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
         _loc2_.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
         _loc2_.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(this.onActivityPointNotification));
         _loc2_.addHabboConnectionMessageEvent(new ActivityPointsMessageEvent(this.onActivityPoints));
      }
      
      private function onQuestList(param1:IMessageEvent) : void
      {
         var _loc2_:QuestListMessageParser = (param1 as QuestListMessageEvent).getParser();
         Logger.log("Got Quest List: " + _loc2_.campaignId + " quests: " + _loc2_.quests.length);
         this._questEngine.controller.openCampaign(_loc2_.campaignId,_loc2_.activityPointType,_loc2_.quests);
      }
      
      private function onQuestAccepted(param1:IMessageEvent) : void
      {
         var _loc2_:QuestAcceptedMessageParser = (param1 as QuestAcceptedMessageEvent).getParser();
         Logger.log("Quest Accepted: " + _loc2_.campaignId + " quest: " + _loc2_.questData.id);
         this._questEngine.controller.questAccepted(_loc2_.campaignId,_loc2_.questData);
      }
      
      private function onQuestCompleted(param1:IMessageEvent) : void
      {
         var _loc2_:QuestCompletedMessageParser = (param1 as QuestCompletedMessageEvent).getParser();
         Logger.log("Quest Completed: " + _loc2_.campaignId + " quest: " + _loc2_.questData.id);
         this._questEngine.controller.questCompleted(_loc2_.campaignId,_loc2_.questData);
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(this._questEngine.toolbar != null && this._questEngine.configuration != null)
         {
            _loc2_ = this._questEngine.configuration.getKey("questing.defaultCampaign","");
            if(_loc2_ != null && _loc2_ != "")
            {
               this._questEngine.toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_110,HabboToolbarIconEnum.QUESTS));
            }
         }
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         this._questEngine.controller.close();
         this._questEngine.toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_153,HabboToolbarIconEnum.QUESTS));
      }
      
      private function onActivityPointNotification(param1:IMessageEvent) : void
      {
         var _loc2_:HabboActivityPointNotificationMessageEvent = param1 as HabboActivityPointNotificationMessageEvent;
         Logger.log("Got balance update");
         this._questEngine.controller.method_2();
      }
      
      private function onActivityPoints(param1:IMessageEvent) : void
      {
         var _loc2_:ActivityPointsMessageEvent = param1 as ActivityPointsMessageEvent;
         Logger.log("Got balance");
         this._questEngine.controller.method_2();
      }
   }
}
