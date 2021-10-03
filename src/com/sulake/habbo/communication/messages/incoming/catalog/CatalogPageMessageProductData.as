package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_79:String = "i";
      
      public static const const_82:String = "s";
      
      public static const const_215:String = "e";
       
      
      private var var_1769:String;
      
      private var var_2510:int;
      
      private var var_1369:String;
      
      private var var_1370:int;
      
      private var var_1768:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1769 = param1.readString();
         this.var_2510 = param1.readInteger();
         this.var_1369 = param1.readString();
         this.var_1370 = param1.readInteger();
         this.var_1768 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1769;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2510;
      }
      
      public function get extraParam() : String
      {
         return this.var_1369;
      }
      
      public function get productCount() : int
      {
         return this.var_1370;
      }
      
      public function get expiration() : int
      {
         return this.var_1768;
      }
   }
}
