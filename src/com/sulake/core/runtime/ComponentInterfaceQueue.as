package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1559:IID;
      
      private var var_693:Boolean;
      
      private var var_1011:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1559 = param1;
         this.var_1011 = new Array();
         this.var_693 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1559;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function get receivers() : Array
      {
         return this.var_1011;
      }
      
      public function dispose() : void
      {
         if(!this.var_693)
         {
            this.var_693 = true;
            this.var_1559 = null;
            while(this.var_1011.length > 0)
            {
               this.var_1011.pop();
            }
            this.var_1011 = null;
         }
      }
   }
}
