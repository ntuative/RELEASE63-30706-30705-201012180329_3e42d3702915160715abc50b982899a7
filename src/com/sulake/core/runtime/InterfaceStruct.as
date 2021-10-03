package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1332:IID;
      
      private var var_1702:String;
      
      private var var_107:IUnknown;
      
      private var var_714:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1332 = param1;
         this.var_1702 = getQualifiedClassName(this.var_1332);
         this.var_107 = param2;
         this.var_714 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1332;
      }
      
      public function get iis() : String
      {
         return this.var_1702;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_107;
      }
      
      public function get references() : uint
      {
         return this.var_714;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_107 == null;
      }
      
      public function dispose() : void
      {
         this.var_1332 = null;
         this.var_1702 = null;
         this.var_107 = null;
         this.var_714 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_714;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_714) : uint(0);
      }
   }
}
