package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1715:int;
      
      private var var_2531:int;
      
      private var var_1115:int;
      
      private var var_474:Number;
      
      private var var_2533:Boolean;
      
      private var var_2532:int;
      
      private var var_1815:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2531 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2532 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2533 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1115;
         if(this.var_1115 == 1)
         {
            this.var_474 = param1;
            this.var_1715 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1115);
            this.var_474 = this.var_474 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2533 && param3 - this.var_1715 >= this.var_2531 && this.var_1815 < this.var_2532)
         {
            _loc5_ = 1000 / this.var_474;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1815;
            this.var_1715 = param3;
            this.var_1115 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
