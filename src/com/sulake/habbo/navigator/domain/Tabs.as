package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_349:int = 1;
      
      public static const const_242:int = 2;
      
      public static const const_265:int = 3;
      
      public static const const_340:int = 4;
      
      public static const const_249:int = 5;
      
      public static const const_374:int = 1;
      
      public static const const_737:int = 2;
      
      public static const const_565:int = 3;
      
      public static const const_601:int = 4;
      
      public static const const_246:int = 5;
      
      public static const const_645:int = 6;
      
      public static const const_775:int = 7;
      
      public static const const_254:int = 8;
      
      public static const const_375:int = 9;
      
      public static const const_1705:int = 10;
      
      public static const const_684:int = 11;
      
      public static const const_457:int = 12;
       
      
      private var var_388:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_388 = new Array();
         this.var_388.push(new Tab(this._navigator,const_349,const_457,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_537));
         this.var_388.push(new Tab(this._navigator,const_242,const_374,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_537));
         this.var_388.push(new Tab(this._navigator,const_340,const_684,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_889));
         this.var_388.push(new Tab(this._navigator,const_265,const_246,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_537));
         this.var_388.push(new Tab(this._navigator,const_249,const_254,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_682));
         this.setSelectedTab(const_349);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_340;
      }
      
      public function get tabs() : Array
      {
         return this.var_388;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_388)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_388)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_388)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
