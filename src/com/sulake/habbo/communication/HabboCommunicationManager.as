package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private const const_1852:int = 2;
      
      private var var_283:ICoreCommunicationManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_545:int = 0;
      
      private var var_1316:IMessageConfiguration;
      
      private var var_33:String = "";
      
      private var var_245:Array;
      
      private var var_402:int = -1;
      
      private var var_1365:Timer;
      
      private var var_898:int = 1;
      
      private var var_125:String = "";
      
      private var var_2471:Boolean = false;
      
      private var var_2469:Boolean = false;
      
      private var var_2470:Boolean = false;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1316 = new HabboMessages();
         this.var_245 = [];
         this.var_1365 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),this.onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,this.unloading);
      }
      
      public function get mode() : int
      {
         return this.var_545;
      }
      
      public function set mode(param1:int) : void
      {
         this.var_545 = param1;
      }
      
      public function get port() : int
      {
         if(this.var_245.length == 0 || this.var_402 < 0 || this.var_402 >= this.var_245.length)
         {
            return 0;
         }
         return this.var_245[this.var_402];
      }
      
      private function unloading(param1:Event) : void
      {
         if(this._connection)
         {
            this._connection.send(new DisconnectMessageComposer());
            this._connection.dispose();
            this._connection = null;
         }
      }
      
      override public function dispose() : void
      {
         if(this._connection)
         {
            this._connection.dispose();
            this._connection = null;
         }
         if(this.var_283)
         {
            this.var_283.release(new IIDCoreCommunicationManager());
            this.var_283 = null;
         }
         if(this._habboConfiguration)
         {
            this._habboConfiguration.release(new IIDHabboConfigurationManager());
            this._habboConfiguration = null;
         }
         super.dispose();
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            this.var_283 = param2 as ICoreCommunicationManager;
            this.var_283.connectionStateListener = this;
            this.var_283.registerProtocolType(HabboProtocolType.const_1112,WedgieProtocol);
            this._connection = this.var_283.createConnection(HabboConnectionType.const_230,ConnectionType.const_947);
            _loc3_ = this.var_283.getProtocolInstanceOfType(HabboProtocolType.const_1112);
            this._connection.registerMessageClasses(this.var_1316);
            this._connection.protocol = _loc3_;
            this._connection.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this._connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this._connection.addEventListener(Event.CONNECT,this.onConnect);
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 != null)
         {
            Logger.log("Habbo Communication Manager: init based on configuration: " + this._habboConfiguration);
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            this._habboConfiguration = param2 as IHabboConfigurationManager;
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            this.var_245 = [];
            this.var_33 = this._habboConfiguration.getKey("connection.info.host",null);
            if(this.var_33 == null)
            {
               Core.crash("connection.info.host was not defined",Core.const_291);
               return;
            }
            _loc3_ = this._habboConfiguration.getKey("connection.info.port",null);
            if(_loc3_ == null)
            {
               Core.crash("connection.info.port was not defined",Core.const_291);
               return;
            }
            if(this._habboConfiguration.keyExists("local.environment"))
            {
               this.var_33 = this._habboConfiguration.getKey("connection.info.host.local");
               _loc3_ = this._habboConfiguration.getKey("connection.info.port.local");
            }
            _loc4_ = this.validateHost();
            if(!_loc4_)
            {
               Core.crash("Tried to connect to an invalid host: " + this.var_33,Core.const_291);
               return;
            }
            _loc5_ = _loc3_.split(",");
            for each(_loc6_ in _loc5_)
            {
               this.var_245.push(parseInt(_loc6_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + this.var_33);
            Logger.log("Connection Host: " + this.var_33);
            Logger.log("Connection Ports: " + this.var_245);
            Logger.log("Habbo Connection Info:" + this._connection);
            this.var_2469 = true;
            if(this.var_2470)
            {
               this.nextPort();
            }
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      private function validateHost() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Array = this.var_33.split(".");
         if(_loc1_.length >= 2)
         {
            _loc2_ = _loc1_.length - 1;
            if(_loc1_[_loc2_] == "com" && (_loc1_[_loc2_ - 1] == "habbo" || _loc1_[_loc2_ - 1] == "sulake"))
            {
               return true;
            }
            if(_loc1_[_loc2_] == "net" && _loc1_[_loc2_ - 1] == "varoke")
            {
               return true;
            }
         }
         return false;
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_230:
               if(this._habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_291);
                  return;
               }
               if(this._connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_291);
                  return;
               }
               this.var_2470 = true;
               if(this.var_2469)
               {
                  this.nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      private function nextPort() : void
      {
         var _loc1_:int = 0;
         if(this._connection.connected)
         {
            Logger.log("Warning: Already connected so will not try to connect again!");
            return;
         }
         ++this.var_402;
         if(this.var_402 >= this.var_245.length)
         {
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + this.var_898);
            ++this.var_898;
            _loc1_ = this.const_1852;
            if(this.var_245.length == 1)
            {
               _loc1_++;
            }
            if(this.var_898 > _loc1_)
            {
               if(this.var_2471)
               {
                  return;
               }
               this.var_2471 = true;
               Core.error("Connection failed to host " + this.var_33 + " ports " + this.var_245,true,Core.const_291);
               return;
            }
            this.var_402 = 0;
         }
         this._connection.timeout = this.var_898 * 10000;
         this._connection.init(this.var_33,this.var_245[this.var_402]);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + this.var_245[this.var_402]);
         this.tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + this.var_898 + " attempts");
      }
      
      private function tryNextPort() : void
      {
         this.var_1365.addEventListener(TimerEvent.TIMER,this.onTryNextPort);
         this.var_1365.start();
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         this.var_1365.stop();
         this.nextPort();
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + this.var_245[this.var_402]);
         this.tryNextPort();
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!this.var_283 ? this.var_283.queueConnection(HabboConnectionType.const_230,param1) : null;
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         if(this.var_283)
         {
            this.var_283.addConnectionMessageEvent(HabboConnectionType.const_230,param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = this._habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1471,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1437,String(param2));
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1274,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1321,param1 + " " + param2);
         if(this.var_125.length > 0)
         {
            this.var_125 += ",R:" + param1;
         }
         else
         {
            this.var_125 = "R:" + param1;
         }
         if(this.var_125.length > 150)
         {
            this.var_125 = this.var_125.substring(this.var_125.length - 150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",this.var_125);
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1406,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1383,param1 + " " + param2);
         if(this.var_125.length > 0)
         {
            this.var_125 += ",S:" + param1;
         }
         else
         {
            this.var_125 = "S:" + param1;
         }
         if(this.var_125.length > 150)
         {
            this.var_125 = this.var_125.substring(this.var_125.length - 150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",this.var_125);
      }
   }
}
