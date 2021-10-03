package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var _configuration:IHabboConfigurationManager = null;
      
      private var var_518:int = 0;
      
      private var var_474:Number = 0;
      
      private var var_2671:Array;
      
      private var var_1345:String = "";
      
      private var var_1713:String = "";
      
      private var var_2393:String = "";
      
      private var var_2395:String = "";
      
      private var var_1695:Boolean = false;
      
      private var var_1714:GarbageMonitor = null;
      
      private var var_1346:int = 0;
      
      private var var_2417:Boolean;
      
      private var var_1717:int = 1000;
      
      private var var_1348:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1715:int = 0;
      
      private var var_1716:int = 10;
      
      private var var_1347:int = 0;
      
      private var var_2418:Number = 0.15;
      
      private var var_2415:Boolean = true;
      
      private var var_2416:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_2671 = [];
         super();
         this.var_1713 = Capabilities.version;
         this.var_2393 = Capabilities.os;
         this.var_1695 = Capabilities.isDebugger;
         this.var_1345 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1345 == null)
         {
            this.var_1345 = "unknown";
         }
         this.var_1714 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1715 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1713;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_474;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1717 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1716 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this._configuration = param1;
         this._reportInterval = int(this._configuration.getKey("performancetest.interval","60"));
         this.var_1717 = int(this._configuration.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1716 = int(this._configuration.getKey("performancetest.reportlimit","10"));
         this.var_2418 = Number(this._configuration.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2415 = Boolean(int(this._configuration.getKey("performancetest.distribution.enabled","1")));
         this.var_2417 = Boolean(this._configuration.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1714.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1714.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         if(this.var_2417)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1346;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1717)
         {
            ++this.var_1348;
            _loc3_ = true;
         }
         else
         {
            ++this.var_518;
            if(this.var_518 <= 1)
            {
               this.var_474 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_518);
               this.var_474 = this.var_474 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1715 > this._reportInterval * 1000 && this.var_1347 < this.var_1716)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_474);
            _loc6_ = true;
            if(this.var_2415 && this.var_1347 > 0)
            {
               _loc7_ = this.differenceInPercents(this.var_2416,this.var_474);
               if(_loc7_ < this.var_2418)
               {
                  _loc6_ = false;
               }
            }
            this.var_1715 = param2;
            if(_loc6_ || _loc3_)
            {
               this.var_2416 = this.var_474;
               if(this.sendReport(param2))
               {
                  ++this.var_1347;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1345,this.var_1713,this.var_2393,this.var_2395,this.var_1695,_loc5_,_loc4_,this.var_1346,this.var_474,this.var_1348);
            this._connection.send(_loc2_);
            this.var_1346 = 0;
            this.var_474 = 0;
            this.var_518 = 0;
            this.var_1348 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
