package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_579;
         param1["bitmap"] = const_722;
         param1["border"] = const_612;
         param1["border_notify"] = const_1463;
         param1["button"] = const_535;
         param1["button_thick"] = const_760;
         param1["button_icon"] = const_1475;
         param1["button_group_left"] = const_800;
         param1["button_group_center"] = const_655;
         param1["button_group_right"] = const_651;
         param1["canvas"] = const_815;
         param1["checkbox"] = const_636;
         param1["closebutton"] = const_1030;
         param1["container"] = const_323;
         param1["container_button"] = const_764;
         param1["display_object_wrapper"] = const_564;
         param1["dropmenu"] = const_490;
         param1["dropmenu_item"] = const_528;
         param1["frame"] = const_321;
         param1["frame_notify"] = const_1470;
         param1["header"] = const_736;
         param1["icon"] = const_1110;
         param1["itemgrid"] = const_964;
         param1["itemgrid_horizontal"] = const_416;
         param1["itemgrid_vertical"] = const_616;
         param1["itemlist"] = const_966;
         param1["itemlist_horizontal"] = const_334;
         param1["itemlist_vertical"] = const_352;
         param1["maximizebox"] = WINDOW_TYPE_MAXIMIZEBOX;
         param1["menu"] = const_1393;
         param1["menu_item"] = const_1446;
         param1["submenu"] = const_955;
         param1["minimizebox"] = const_1347;
         param1["notify"] = const_1494;
         param1["null"] = const_804;
         param1["password"] = const_756;
         param1["radiobutton"] = const_600;
         param1["region"] = const_772;
         param1["restorebox"] = const_1297;
         param1["scaler"] = const_762;
         param1["scaler_horizontal"] = const_1452;
         param1["scaler_vertical"] = const_1289;
         param1["scrollbar_horizontal"] = const_513;
         param1["scrollbar_vertical"] = const_594;
         param1["scrollbar_slider_button_up"] = const_963;
         param1["scrollbar_slider_button_down"] = const_1055;
         param1["scrollbar_slider_button_left"] = const_920;
         param1["scrollbar_slider_button_right"] = const_985;
         param1["scrollbar_slider_bar_horizontal"] = const_1044;
         param1["scrollbar_slider_bar_vertical"] = const_1022;
         param1["scrollbar_slider_track_horizontal"] = const_915;
         param1["scrollbar_slider_track_vertical"] = const_899;
         param1["scrollable_itemlist"] = const_1493;
         param1["scrollable_itemlist_vertical"] = const_449;
         param1["scrollable_itemlist_horizontal"] = const_938;
         param1["selector"] = const_715;
         param1["selector_list"] = const_566;
         param1["submenu"] = const_955;
         param1["tab_button"] = const_690;
         param1["tab_container_button"] = const_957;
         param1["tab_context"] = const_346;
         param1["tab_content"] = const_932;
         param1["tab_selector"] = const_797;
         param1["text"] = const_665;
         param1["input"] = const_753;
         param1["toolbar"] = const_1481;
         param1["tooltip"] = const_347;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
