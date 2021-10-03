package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_756:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         this.var_756 = new ByteArray();
         this.var_756.writeShort(param1);
         this.var_756.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         this.var_756.position = 0;
         if(this.var_756.bytesAvailable)
         {
            _loc1_ = this.var_756.readShort();
            this.var_756.position = 0;
         }
         return _loc1_;
      }
   }
}
