package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowState;
   import flash.utils.Dictionary;
   
   public class StateCodeTable
   {
       
      
      public function StateCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["default"] = WindowState.const_91;
         param1["active"] = WindowState.const_97;
         param1["focused"] = WindowState.const_78;
         param1["hovering"] = WindowState.WINDOW_STATE_HOVERING;
         param1["selected"] = WindowState.const_46;
         param1["pressed"] = WindowState.const_84;
         param1["disabled"] = WindowState.const_70;
         param1["locked"] = WindowState.const_62;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
