package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1647:int;
      
      private var var_2486:String;
      
      private var var_854:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1647 = param1.readInteger();
         this.var_2486 = param1.readString();
         this.var_854 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1647;
      }
      
      public function get figureString() : String
      {
         return this.var_2486;
      }
      
      public function get gender() : String
      {
         return this.var_854;
      }
   }
}
