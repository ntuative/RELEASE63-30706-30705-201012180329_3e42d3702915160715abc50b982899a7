package com.sulake.habbo.communication.messages.parser.inventory.furni
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
   
   public class FurniListInsertParser implements IMessageParser
   {
       
      
      protected var var_1423:Array;
      
      public function FurniListInsertParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1423 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < 1)
         {
            this.var_1423.push(this.parseItem(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function parseItem(param1:IMessageDataWrapper) : FurniData
      {
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         var _loc4_:String = param1.readString();
         var _loc5_:int = param1.readInteger();
         var _loc6_:int = param1.readInteger();
         var _loc7_:int = param1.readInteger();
         var _loc8_:String = param1.readString();
         var _loc9_:Boolean = param1.readBoolean();
         var _loc10_:Boolean = param1.readBoolean();
         var _loc11_:Boolean = param1.readBoolean();
         var _loc12_:Boolean = param1.readBoolean();
         var _loc13_:int = param1.readInteger();
         var _loc14_:FurniData = new FurniData(_loc2_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc11_,_loc9_,_loc10_,_loc12_,_loc13_);
         if(_loc4_ == "S")
         {
            _loc15_ = param1.readString();
            _loc16_ = param1.readInteger();
            _loc14_.setExtraData(_loc15_,_loc16_);
         }
         return _loc14_;
      }
      
      public function flush() : Boolean
      {
         this.var_1423 = null;
         return true;
      }
      
      public function getFurni() : Array
      {
         return this.var_1423;
      }
   }
}
