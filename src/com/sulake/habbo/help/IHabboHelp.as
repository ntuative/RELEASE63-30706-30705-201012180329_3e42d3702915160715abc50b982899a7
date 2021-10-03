package com.sulake.habbo.help
{
   import com.sulake.core.runtime.IUnknown;
   import flash.events.IEventDispatcher;
   
   public interface IHabboHelp extends IUnknown
   {
       
      
      function get events() : IEventDispatcher;
      
      function method_13(param1:int, param2:String) : void;
   }
}
