package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var var_1215:String;
      
      private var var_155:String;
      
      private var var_2593:String;
      
      private var var_1495:String;
      
      private var _color:IPartColor;
      
      private var _frames:Array;
      
      private var _action:IActionDefinition;
      
      private var var_1414:Boolean;
      
      private var _isBlendable:Boolean;
      
      private var var_2591:ColorTransform;
      
      private var var_2592:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:String, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         this.var_1215 = param1;
         this.var_155 = param2;
         this.var_1495 = param3;
         this._color = param4;
         this._frames = param5;
         this._action = param6;
         this.var_1414 = param7;
         this.var_2592 = param8;
         this.var_2593 = param9;
         this._isBlendable = param10;
         this.var_2591 = new ColorTransform(1,1,1,param11);
         if(this._frames == null)
         {
            Logger.log("Null frame list");
         }
         if(this.var_155 == "ey")
         {
            this.var_1414 = false;
         }
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return this._frames[param1 % this._frames.length];
      }
      
      public function get frames() : Array
      {
         return this._frames;
      }
      
      public function get bodyPartId() : String
      {
         return this.var_1215;
      }
      
      public function get partType() : String
      {
         return this.var_155;
      }
      
      public function get partId() : String
      {
         return this.var_1495;
      }
      
      public function get color() : IPartColor
      {
         return this._color;
      }
      
      public function get action() : IActionDefinition
      {
         return this._action;
      }
      
      public function set isColorable(param1:Boolean) : void
      {
         this.var_1414 = param1;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1414;
      }
      
      public function get method_7() : int
      {
         return this.var_2592;
      }
      
      public function get flippedPartType() : String
      {
         return this.var_2593;
      }
      
      public function get isBlendable() : Boolean
      {
         return this._isBlendable;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return this.var_2591;
      }
   }
}
