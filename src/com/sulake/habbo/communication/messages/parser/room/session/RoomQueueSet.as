package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.utils.Map;
   
   public class RoomQueueSet
   {
       
      
      private var _name:String;
      
      private var _target:int;
      
      private var var_1197:Map;
      
      public function RoomQueueSet(param1:String, param2:int)
      {
         super();
         this._name = param1;
         this._target = param2;
         this.var_1197 = new Map();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get target() : int
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
