package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.ITextWindow;
   
   public class QuestHelp implements IDisposable
   {
       
      
      private var var_68:QuestCampaign;
      
      private var _view:IWindow;
      
      private var var_2336:IScrollableListWindow;
      
      private var var_693:Boolean = false;
      
      public function QuestHelp(param1:QuestCampaign)
      {
         super();
         this.var_68 = param1;
         this.createView();
      }
      
      public function dispose() : void
      {
         if(this._view)
         {
            this._view.dispose();
         }
         this.var_693 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      private function createView() : void
      {
         this._view = this.var_68.controller.questEngine.getXmlWindow("QuestHelp");
         this.var_2336 = this.find("help.content.itemlist") as IScrollableListWindow;
         if(!this._view)
         {
            throw new Error("[QuestView] Could not create view for quest help!");
         }
         var _loc1_:ITextWindow = this.find("help.description") as ITextWindow;
         if(_loc1_)
         {
            if(_loc1_.textHeight > _loc1_.height)
            {
               _loc1_.height = _loc1_.textHeight + 5;
            }
         }
      }
      
      public function get view() : IWindow
      {
         return this._view;
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
   }
}
