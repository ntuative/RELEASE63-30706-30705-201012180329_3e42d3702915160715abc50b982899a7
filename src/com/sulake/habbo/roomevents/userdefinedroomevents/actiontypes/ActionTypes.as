package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.userdefinedroomevents.Element;
   import com.sulake.habbo.roomevents.userdefinedroomevents.ElementTypeHolder;
   
   public class ActionTypes implements ElementTypeHolder
   {
       
      
      private var var_355:Array;
      
      public function ActionTypes()
      {
         this.var_355 = new Array();
         super();
         this.var_355.push(new ToggleFurniState());
         this.var_355.push(new Reset());
         this.var_355.push(new SetFurniStateTo());
         this.var_355.push(new MoveFurni());
         this.var_355.push(new GiveScore());
         this.var_355.push(new Chat());
         this.var_355.push(new Teleport());
      }
      
      public function get types() : Array
      {
         return this.var_355;
      }
      
      public function getByCode(param1:int) : ActionType
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_355)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getElementByCode(param1:int) : Element
      {
         return this.getByCode(param1);
      }
      
      public function acceptTriggerable(param1:Triggerable) : Boolean
      {
         return param1 as ActionDefinition != null;
      }
      
      public function getKey() : String
      {
         return "action";
      }
   }
}
