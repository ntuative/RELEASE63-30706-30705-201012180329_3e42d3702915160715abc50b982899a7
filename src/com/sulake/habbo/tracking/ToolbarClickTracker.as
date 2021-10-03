package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1182:IHabboTracking;
      
      private var var_1620:Boolean = false;
      
      private var var_2185:int = 0;
      
      private var var_1591:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1182 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1182 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1620 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2185 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1620)
         {
            return;
         }
         ++this.var_1591;
         if(this.var_1591 <= this.var_2185)
         {
            this.var_1182.track("toolbar",param1);
         }
      }
   }
}
