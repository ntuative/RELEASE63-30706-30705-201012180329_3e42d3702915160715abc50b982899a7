package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2181:Boolean;
      
      private var var_2182:int;
      
      private var var_1590:Array;
      
      private var var_738:Array;
      
      private var var_737:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2181;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2182;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1590;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_738;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_737;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1590 = [];
         this.var_738 = [];
         this.var_737 = [];
         this.var_2181 = param1.readBoolean();
         this.var_2182 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1590.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_738.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_737.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
