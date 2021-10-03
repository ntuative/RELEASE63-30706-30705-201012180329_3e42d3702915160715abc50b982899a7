package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_426:int = -2.147483648E9;
      
      private var var_425:int = 2.147483647E9;
      
      private var var_424:int = -2.147483648E9;
      
      private var var_423:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_426;
      }
      
      public function get maxWidth() : int
      {
         return this.var_425;
      }
      
      public function get minHeight() : int
      {
         return this.var_424;
      }
      
      public function get maxHeight() : int
      {
         return this.var_423;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_426 = param1;
         if(this.var_426 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_426)
         {
            this._target.width = this.var_426;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_425 = param1;
         if(this.var_425 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_425)
         {
            this._target.width = this.var_425;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_424 = param1;
         if(this.var_424 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_424)
         {
            this._target.height = this.var_424;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_423 = param1;
         if(this.var_423 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_423)
         {
            this._target.height = this.var_423;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_426 == int.MIN_VALUE && this.var_425 == int.MAX_VALUE && this.var_424 == int.MIN_VALUE && this.var_423 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_426 = int.MIN_VALUE;
         this.var_425 = int.MAX_VALUE;
         this.var_424 = int.MIN_VALUE;
         this.var_423 = int.MAX_VALUE;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_426 = this.var_426;
         _loc2_.var_425 = this.var_425;
         _loc2_.var_424 = this.var_424;
         _loc2_.var_423 = this.var_423;
         return _loc2_;
      }
   }
}
