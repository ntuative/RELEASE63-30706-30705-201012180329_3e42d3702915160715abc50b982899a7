package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_67:String = "HTE_INITIALIZED";
      
      public static const const_38:String = "HTE_TOOLBAR_CLICK";
      
      public static const TOOLBAR_ORIENTATION:String = "HTE_TOOLBAR_ORIENTATION";
       
      
      private var var_645:String;
      
      private var var_448:String;
      
      private var var_1229:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_645 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_645;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_448 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_448;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1229 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1229;
      }
   }
}
