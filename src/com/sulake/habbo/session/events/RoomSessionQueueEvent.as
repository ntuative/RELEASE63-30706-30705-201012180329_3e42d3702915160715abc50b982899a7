package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_409:String = "RSQE_QUEUE_STATUS";
      
      public static const const_912:String = "c";
      
      public static const const_1262:String = "d";
      
      public static const const_898:int = 2;
      
      public static const const_946:int = 1;
       
      
      private var _name:String;
      
      private var _target:int;
      
      private var var_1197:Map;
      
      private var var_384:Boolean;
      
      private var var_2694:String;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_409,param1,param5,param6);
         this._name = param2;
         this._target = param3;
         this.var_1197 = new Map();
         this.var_384 = param4;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_384;
      }
      
      public function get queueSetName() : String
      {
         return this._name;
      }
      
      public function get queueSetTarget() : int
      {
         return this._target;
      }
      
      public function get queueTypes() : Array
      {
         return this.var_1197.getKeys();
      }
      
      public function getQueueSize(param1:String) : int
      {
         return this.var_1197.getValue(param1);
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         this.var_1197.add(param1,param2);
      }
   }
}
