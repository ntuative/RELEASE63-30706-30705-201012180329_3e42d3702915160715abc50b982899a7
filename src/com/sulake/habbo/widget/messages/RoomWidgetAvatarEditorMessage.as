package com.sulake.habbo.widget.messages
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomWidgetAvatarEditorMessage extends RoomWidgetMessage
   {
      
      public static const const_318:String = "RWCM_OPEN_AVATAR_EDITOR";
      
      public static const const_1296:String = "RWCM_GET_WARDROBE";
      
      public static const const_656:String = "RWAEM_AVATAR_EDITOR_VIEW_DISPOSED";
       
      
      private var var_16:IWindowContainer;
      
      public function RoomWidgetAvatarEditorMessage(param1:String, param2:IWindowContainer = null)
      {
         super(param1);
         this.var_16 = param2;
      }
      
      public function get context() : IWindowContainer
      {
         return this.var_16;
      }
   }
}
