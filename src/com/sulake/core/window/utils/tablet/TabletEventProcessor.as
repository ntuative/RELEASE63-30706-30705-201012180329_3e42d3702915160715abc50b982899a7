package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2713:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_130 = param1.desktop;
         var_78 = param1.var_1160 as WindowController;
         _lastClickTarget = param1.var_1157 as WindowController;
         var_149 = param1.renderer;
         var_770 = param1.var_1158;
         param2.begin();
         param2.end();
         param1.desktop = var_130;
         param1.var_1160 = var_78;
         param1.var_1157 = _lastClickTarget;
         param1.renderer = var_149;
         param1.var_1158 = var_770;
      }
   }
}
