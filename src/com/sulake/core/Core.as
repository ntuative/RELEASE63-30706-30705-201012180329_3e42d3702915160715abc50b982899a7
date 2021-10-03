package com.sulake.core
{
   import com.sulake.core.runtime.CoreComponentContext;
   import com.sulake.core.runtime.ICore;
   import flash.display.DisplayObjectContainer;
   
   public final class Core
   {
      
      public static const const_1070:uint = 0;
      
      public static const const_763:uint = 1;
      
      public static const const_1276:uint = 2;
      
      public static const const_1035:uint = 7;
      
      public static const CORE_SETUP_DEBUG:uint = 7;
      
      public static const const_274:int = 1;
      
      public static const const_1411:int = 2;
      
      public static const const_1361:int = 3;
      
      public static const const_576:int = 4;
      
      public static const const_1498:int = 5;
      
      public static const const_1354:int = 6;
      
      public static const const_1646:int = 7;
      
      public static const const_9:int = 9;
      
      public static const const_987:int = 10;
      
      public static const const_22:int = 11;
      
      public static const const_1329:int = 20;
      
      public static const const_1673:int = 21;
      
      public static const const_291:int = 30;
      
      public static const const_998:int = 99;
      
      private static var _instance:ICore;
       
      
      public function Core()
      {
         super();
      }
      
      public static function get version() : String
      {
         return "0.0.2";
      }
      
      public static function get instance() : ICore
      {
         return _instance;
      }
      
      public static function instantiate(param1:DisplayObjectContainer, param2:uint) : ICore
      {
         if(_instance == null)
         {
            _instance = new CoreComponentContext(param1,param2);
         }
         return _instance;
      }
      
      public static function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,param2,param3,param4);
         }
      }
      
      public static function warning(param1:String) : void
      {
         if(_instance)
         {
            _instance.warning(param1);
         }
      }
      
      public static function debug(param1:String) : void
      {
         if(_instance)
         {
            _instance.debug(param1);
         }
      }
      
      public static function crash(param1:String, param2:int, param3:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,true,param2,param3);
         }
      }
      
      public static function dispose() : void
      {
         if(_instance != null)
         {
            _instance.dispose();
            _instance = null;
         }
      }
   }
}
