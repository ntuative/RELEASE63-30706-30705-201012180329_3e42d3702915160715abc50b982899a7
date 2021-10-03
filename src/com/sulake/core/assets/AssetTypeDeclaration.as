package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1955:String;
      
      private var var_1957:Class;
      
      private var var_1956:Class;
      
      private var var_1445:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_1955 = param1;
         this.var_1957 = param2;
         this.var_1956 = param3;
         if(rest == null)
         {
            this.var_1445 = new Array();
         }
         else
         {
            this.var_1445 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_1955;
      }
      
      public function get assetClass() : Class
      {
         return this.var_1957;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_1956;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1445;
      }
   }
}
