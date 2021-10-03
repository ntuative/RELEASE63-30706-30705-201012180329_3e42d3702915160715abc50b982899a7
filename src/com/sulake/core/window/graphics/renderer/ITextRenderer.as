package com.sulake.core.window.graphics.renderer
{
   import flash.text.TextField;
   
   public interface ITextRenderer extends ISkinRenderer
   {
       
      
      function get textField() : TextField;
      
      function set textField(param1:TextField) : void;
   }
}
