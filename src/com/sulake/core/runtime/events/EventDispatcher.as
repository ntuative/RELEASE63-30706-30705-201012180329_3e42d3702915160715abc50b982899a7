package com.sulake.core.runtime.events
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class EventDispatcher implements IEventDispatcher, IDisposable
   {
      
      private static const const_549:uint = 0;
      
      private static const const_1203:uint = 1;
      
      private static const const_860:uint = 2;
       
      
      protected var _disposed:Boolean = false;
      
      private var var_218:flash.events.EventDispatcher;
      
      private var var_238:Dictionary;
      
      private var _result:uint;
      
      private var var_572:Error;
      
      public function EventDispatcher(param1:IEventDispatcher = null)
      {
         this.var_238 = new Dictionary();
         super();
         this.var_218 = new flash.events.EventDispatcher(!!param1 ? param1 : this);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get error() : Error
      {
         return this.var_572;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc8_:* = null;
         var _loc6_:Array = this.var_238[param1];
         var _loc7_:EventListenerStruct = new EventListenerStruct(param2,param3,param4,param5);
         if(!_loc6_)
         {
            _loc6_ = [_loc7_];
            this.var_238[param1] = _loc6_;
            this.var_218.addEventListener(param1,this.eventProcessor);
         }
         else
         {
            for each(_loc8_ in _loc6_)
            {
               if(_loc8_.callback == param2 && _loc8_.var_1878 == param3)
               {
                  return;
               }
               if(param4 > _loc8_.priority)
               {
                  _loc6_.splice(_loc6_.indexOf(_loc8_),0,_loc7_);
                  return;
               }
            }
            _loc6_.push(_loc7_);
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(!this._disposed)
         {
            _loc4_ = this.var_238[param1];
            if(_loc4_)
            {
               _loc5_ = 0;
               for each(_loc6_ in _loc4_)
               {
                  if(_loc6_.callback == param2 && _loc6_.var_1878 == param3)
                  {
                     _loc4_.splice(_loc5_,1);
                     _loc6_.callback = null;
                     if(_loc4_.length == 0)
                     {
                        delete this.var_238[param1];
                     }
                     return;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(!this._disposed)
         {
            this._result = const_549;
            this.var_218.dispatchEvent(param1);
            if(this._result == const_860)
            {
               if(this.var_572 != null)
               {
                  Core.crash("Error catched when handling " + getQualifiedClassName(param1) + ": " + this.var_572.message,this.var_572.errorID,this.var_572);
               }
               else
               {
                  Core.crash("Error catched when handling " + getQualifiedClassName(param1) + ". No error data available!",0,this.var_572);
               }
            }
            return this._result == const_549;
         }
         return false;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!this._disposed ? false : this.var_238[param1] != null;
      }
      
      public function callEventListeners(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = this.var_238[param1];
         if(_loc2_)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.callback(null);
            }
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!this._disposed ? false : this.var_238[param1] != null;
      }
      
      private function eventProcessor(param1:Event) : void
      {
         var callbacks:Array = null;
         var callback:Function = null;
         var struct:EventListenerStruct = null;
         var event:Event = param1;
         var array:Array = this.var_238[event.type];
         if(array)
         {
            callbacks = [];
            for each(struct in array)
            {
               callbacks.push(struct.callback);
            }
            while(callbacks.length > 0)
            {
               try
               {
                  callback = callbacks.shift();
                  callback(event);
               }
               catch(e:Error)
               {
                  Logger.log(e.getStackTrace());
                  _result = const_860;
                  var_572 = e;
                  return;
               }
            }
         }
         this._result = !!event.isDefaultPrevented() ? uint(const_1203) : uint(const_549);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._disposed)
         {
            for(_loc1_ in this.var_238)
            {
               _loc2_ = this.var_238[_loc1_] as Array;
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.callback = null;
               }
               delete this.var_238[_loc1_];
            }
            this.var_238 = null;
            this.var_218 = null;
            this._disposed = true;
         }
      }
   }
}
