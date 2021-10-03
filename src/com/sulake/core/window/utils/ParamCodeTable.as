package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_162;
         param1["bound_to_parent_rect"] = const_94;
         param1["child_window"] = const_986;
         param1["embedded_controller"] = const_984;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_28;
         param1["internal_event_handling"] = const_675;
         param1["mouse_dragging_target"] = const_214;
         param1["mouse_dragging_trigger"] = const_359;
         param1["mouse_scaling_target"] = const_295;
         param1["mouse_scaling_trigger"] = const_526;
         param1["horizontal_mouse_scaling_trigger"] = const_240;
         param1["vertical_mouse_scaling_trigger"] = const_238;
         param1["observe_parent_input_events"] = const_974;
         param1["optimize_region_to_layout_size"] = const_512;
         param1["parent_window"] = const_1043;
         param1["relative_horizontal_scale_center"] = const_166;
         param1["relative_horizontal_scale_fixed"] = const_125;
         param1["relative_horizontal_scale_move"] = const_353;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_993;
         param1["relative_scale_fixed"] = const_708;
         param1["relative_scale_move"] = const_1116;
         param1["relative_scale_strech"] = const_988;
         param1["relative_vertical_scale_center"] = const_187;
         param1["relative_vertical_scale_fixed"] = const_123;
         param1["relative_vertical_scale_move"] = const_377;
         param1["relative_vertical_scale_strech"] = const_316;
         param1["on_resize_align_left"] = const_768;
         param1["on_resize_align_right"] = const_461;
         param1["on_resize_align_center"] = const_438;
         param1["on_resize_align_top"] = const_689;
         param1["on_resize_align_bottom"] = const_433;
         param1["on_resize_align_middle"] = const_522;
         param1["on_accommodate_align_left"] = const_1109;
         param1["on_accommodate_align_right"] = const_427;
         param1["on_accommodate_align_center"] = const_571;
         param1["on_accommodate_align_top"] = const_1041;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_697;
         param1["route_input_events_to_parent"] = const_503;
         param1["use_parent_graphic_context"] = const_31;
         param1["draggable_with_mouse"] = const_1042;
         param1["scalable_with_mouse"] = const_962;
         param1["reflect_horizontal_resize_to_parent"] = const_469;
         param1["reflect_vertical_resize_to_parent"] = const_403;
         param1["reflect_resize_to_parent"] = const_297;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
