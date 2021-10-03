package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import com.sulake.habbo.quest.enum.QuestTypeEnum;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class QuestView implements IGetImageListener, IDisposable
   {
       
      
      private var var_68:QuestCampaign;
      
      private var var_110:Quest;
      
      private var _view:IWindow;
      
      private var var_1654:int;
      
      private var var_2336:IScrollableListWindow;
      
      private var var_693:Boolean = false;
      
      public function QuestView(param1:QuestCampaign, param2:Quest)
      {
         super();
         this.var_68 = param1;
         this.var_110 = param2;
         this.createView();
      }
      
      public function dispose() : void
      {
         this._view.dispose();
         this.var_693 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function init() : void
      {
         var _loc1_:IWindow = this.find("quest.button.accept");
         if(_loc1_)
         {
            _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onActivateQuest);
         }
         this.localize();
      }
      
      private function createView() : void
      {
         switch(this.var_110.type)
         {
            case QuestTypeEnum.FIND_STUFF:
            case QuestTypeEnum.FIND_HIDDEN_STUFF:
               this._view = this.var_68.controller.questEngine.getXmlWindow("QuestTypeFindStuff");
               this.var_2336 = this.find("quest.content.itemlist") as IScrollableListWindow;
               if(!this._view)
               {
                  throw new Error("[QuestView] Could not create view for quest type: " + this.var_110.type + " !");
               }
               return;
               break;
            default:
               throw new Error("[QuestView] View not defined for quest type: " + this.var_110.type + " !");
         }
      }
      
      public function get view() : IWindow
      {
         return this._view;
      }
      
      public function onActivateQuest(param1:Event, param2:IWindow = null) : void
      {
         if(this.var_110)
         {
            this.var_68.controller.activateQuest(this.var_110);
         }
      }
      
      public function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         if(this.var_693)
         {
            return null;
         }
         if(this._view is IWindowContainer)
         {
            _loc2_ = IWindowContainer(this._view).findChildByName(param1);
         }
         else if(this._view is IItemListWindow)
         {
            _loc2_ = IItemListWindow(this._view).getListItemByName(param1);
         }
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function localize() : void
      {
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc1_:String = ["quest",this.var_68.id,this.var_110.localizationCode].join("_");
         var _loc2_:String = ["quest_" + this.var_68.id,"type_" + this.var_110.type.toLowerCase()].join(".");
         var _loc3_:String = "quest_" + this.var_68.id;
         var _loc4_:* = _loc1_ + ".title";
         var _loc5_:* = _loc1_ + ".short";
         var _loc6_:* = _loc1_ + ".desc";
         var _loc7_:* = _loc2_ + ".requirement";
         var _loc8_:* = _loc2_ + ".success";
         var _loc13_:* = _loc3_ + ".reward.title";
         var _loc14_:* = _loc3_ + ".reward.desc";
         if(this.var_110.type == QuestTypeEnum.FIND_STUFF)
         {
            _loc32_ = this.var_68.controller.questEngine.sessionDataManager.getFloorItemDataByName(this.var_110.roomItemTypeName);
            if(_loc32_)
            {
               _loc33_ = this.var_68.controller.questEngine.roomEngine.getFurnitureImage(_loc32_.id,new Vector3d(90,0,0),64,this,"");
               this.var_1654 = _loc33_.id;
               if(_loc33_ && _loc33_.data)
               {
                  this.imageReady(_loc33_.id,_loc33_.data);
               }
               this.var_68.controller.questEngine.localization.registerParameter(_loc7_,"name",_loc32_.title);
            }
         }
         else if(this.var_110.type == QuestTypeEnum.FIND_HIDDEN_STUFF)
         {
            _loc34_ = this.find("quest.image") as IBitmapWrapperWindow;
            this.var_68.controller.questEngine.setImageFromAsset(_loc34_,"icon_quest_hidden",this.onPreviewImageReady);
         }
         else
         {
            this.var_1654 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         this.setText("quest.header.title",_loc4_);
         this.setText("quest.header.short",_loc5_);
         this.setText("quest.description",_loc6_);
         var _loc15_:IWindow = this.find("quest.button.accept");
         var _loc16_:IWindow = this.find("quest.status");
         _loc15_.visible = false;
         _loc16_.visible = false;
         var _loc17_:IWindow = this.find("quest.status.container");
         var _loc18_:int = 4287150640;
         switch(this.var_110.status)
         {
            case QuestStatusEnum.const_511:
               _loc15_.visible = true;
               break;
            case QuestStatusEnum.const_41:
               this.setText("quest.status","quest.accepted");
               _loc16_.visible = true;
               break;
            case QuestStatusEnum.const_174:
               this.setText("quest.status","quest.expired");
               _loc16_.visible = true;
               _loc18_ = 4290822336;
               break;
            case QuestStatusEnum.const_791:
               this.setText("quest.status","quest.completed");
               _loc16_.visible = true;
               _loc18_ = 4290822336;
               break;
            case QuestStatusEnum.const_165:
               this.setText("quest.status","quest.preview");
               _loc16_.visible = true;
               _loc18_ = 4292927712;
         }
         if(_loc17_)
         {
            _loc17_.color = _loc18_;
         }
         this.setText("quest.requirement",_loc7_);
         this.var_68.controller.questEngine.localization.registerParameter(_loc14_,"amount",this.var_110.rewardCurrencyAmount.toString());
         this.setText("quest.reward.title",_loc13_);
         this.setText("quest.reward.desc",_loc14_);
         var _loc19_:int = this.var_110.endDate.date;
         var _loc20_:int = this.var_110.endDate.month + 1;
         var _loc21_:int = this.var_110.endDate.fullYear;
         var _loc22_:int = this.var_110.endDate.minutes;
         var _loc23_:int = this.var_110.endDate.hours;
         var _loc24_:int = _loc23_ > 11 ? int(_loc23_ - 12) : int(_loc23_);
         var _loc25_:String = _loc23_ < 12 ? "am" : "pm";
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","day",_loc19_.toString());
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","month",_loc20_.toString());
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","year",_loc21_.toString());
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","12h",this.pad(_loc24_));
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","24h",this.pad(_loc23_));
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","ampm",_loc25_);
         this.var_68.controller.questEngine.localization.registerParameter("quest.available","minute",this.pad(_loc22_));
         this.setText("quest.available","quest.available");
         var _loc26_:String = [_loc19_,_loc20_,_loc21_].join(".");
         var _loc27_:String = [this.pad(_loc23_),this.pad(_loc22_)].join(":");
         var _loc28_:IBitmapWrapperWindow = this.find("quest.header.img") as IBitmapWrapperWindow;
         var _loc29_:String = "header_" + this.var_68.id;
         this.var_68.controller.questEngine.setImageFromAsset(_loc28_,_loc29_,this.onHeaderImageReady);
         var _loc30_:IBitmapWrapperWindow = this.find("quest.reward.icon") as IBitmapWrapperWindow;
         var _loc31_:String = "icon_" + this.var_68.id + "_reward_" + this.var_110.rewardCurrencyAmount;
         this.var_68.controller.questEngine.setImageFromAsset(_loc30_,_loc31_,this.onRewardImageReady);
         this.updateMargins();
      }
      
      private function pad(param1:int, param2:int = 2) : String
      {
         var _loc3_:String = param1.toString();
         while(_loc3_.length < param2)
         {
            _loc3_ = "0" + _loc3_;
         }
         return _loc3_;
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:IWindow = this.find(param1);
         if(_loc4_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc4_.caption = param2;
         }
      }
      
      private function onRewardImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_693)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find("quest.reward.icon") as IBitmapWrapperWindow;
            this.var_68.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onRewardImageReady);
         }
      }
      
      private function onHeaderImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_693)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find("quest.header.img") as IBitmapWrapperWindow;
            this.var_68.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onHeaderImageReady);
         }
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_693)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find("quest.image") as IBitmapWrapperWindow;
            this.var_68.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(this.var_693)
         {
            return;
         }
         if(this.var_1654 == param1)
         {
            _loc3_ = this.find("quest.image") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               _loc3_.height = param2.height + 5;
               QuestUtils.setElementImage(_loc3_,param2,_loc3_.height);
               this.updateMargins();
            }
         }
      }
      
      private function updateMargins() : void
      {
         var _loc1_:ITextWindow = this.find("quest.requirement") as ITextWindow;
         var _loc2_:ITextWindow = this.find("quest.description") as ITextWindow;
         _loc1_.height = _loc1_.textHeight + 5;
         _loc2_.height = _loc2_.textHeight + 5;
         if(this.var_2336.maxScrollV > 0)
         {
            _loc1_.margins.right = 20;
            _loc2_.margins.right = 20;
         }
         else
         {
            _loc1_.margins.right = 5;
            _loc2_.margins.right = 5;
         }
         _loc1_.height = _loc1_.textHeight + 5;
         _loc2_.height = _loc2_.textHeight + 5;
      }
   }
}
