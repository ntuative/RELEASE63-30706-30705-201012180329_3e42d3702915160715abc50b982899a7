package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.utils.XMLVariableParser;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import flash.filters.BitmapFilter;
   import flash.filters.DropShadowFilter;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class WindowParser implements IWindowParser
   {
      
      public static const const_906:String = "_EXCLUDE";
      
      public static const const_1684:String = "_INCLUDE";
      
      public static const const_1644:String = "_TEMP";
      
      private static const const_1190:RegExp = /^(\s|\n|\r|\t|\v)*/m;
      
      private static const const_1189:RegExp = /(\s|\n|\r|\t|\v)*$/;
       
      
      protected var _typeStringToCodeTable:Dictionary;
      
      protected var var_1173:Dictionary;
      
      protected var var_939:Dictionary;
      
      protected var var_1426:Dictionary;
      
      protected var var_1895:Map;
      
      protected var var_16:IWindowContext;
      
      private var _disposed:Boolean = false;
      
      public function WindowParser(param1:IWindowContext)
      {
         super();
         this.var_16 = param1;
         this._typeStringToCodeTable = new Dictionary();
         this.var_1173 = new Dictionary();
         TypeCodeTable.fillTables(this._typeStringToCodeTable,this.var_1173);
         this.var_939 = new Dictionary();
         this.var_1426 = new Dictionary();
         ParamCodeTable.fillTables(this.var_939,this.var_1426);
         this.var_1895 = new Map();
      }
      
      private static function trimWhiteSpace(param1:String) : String
      {
         param1 = param1.replace(const_1189,"");
         return param1.replace(const_1190,"");
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this._disposed)
         {
            for(_loc1_ in this._typeStringToCodeTable)
            {
               delete this._typeStringToCodeTable[_loc1_];
            }
            for(_loc1_ in this.var_1173)
            {
               delete this.var_1173[_loc1_];
            }
            for(_loc1_ in this.var_939)
            {
               delete this.var_939[_loc1_];
            }
            for(_loc1_ in this.var_1426)
            {
               delete this.var_1426[_loc1_];
            }
            this.var_1895.dispose();
            this.var_1895 = null;
            this.var_16 = null;
            this._disposed = true;
         }
      }
      
      public function parseAndConstruct(param1:XML, param2:IWindow, param3:Map) : IWindow
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         if(param1.localName() == "layout")
         {
            _loc8_ = param1.child("variables");
            if(_loc8_.length() > 0)
            {
               _loc10_ = _loc8_[0];
               _loc11_ = XML(_loc10_[0]).children();
               if(_loc11_.length() > 0)
               {
                  if(param3 == null)
                  {
                     param3 = new Map();
                  }
                  XMLVariableParser.parseVariableList(_loc11_,param3);
               }
            }
            _loc9_ = param1.child("filters").children();
            if(_loc9_.length() > 0)
            {
               _loc12_ = new Array();
               _loc13_ = 0;
               while(_loc13_ < _loc9_.length())
               {
                  _loc12_.push(this.buildBitmapFilter(_loc9_[_loc13_]));
                  _loc13_++;
               }
               param2.filters = _loc12_;
            }
            _loc4_ = param1.child("window");
            _loc5_ = uint(_loc4_.length());
            switch(_loc5_)
            {
               case 0:
                  return null;
               case 1:
                  param1 = _loc4_[0];
                  break;
               default:
                  _loc7_ = 0;
                  while(_loc7_ < _loc5_)
                  {
                     _loc6_ = this.parseSingleWindowEntity(_loc4_[_loc7_],WindowController(param2),param3);
                     _loc7_++;
                  }
                  return _loc6_;
            }
         }
         if(param1.localName() == "window")
         {
            _loc4_ = param1.children();
            _loc5_ = uint(_loc4_.length());
            if(_loc5_ > 1)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc6_ = this.parseSingleWindowEntity(_loc4_[_loc7_],WindowController(param2),param3);
                  _loc7_++;
               }
               return _loc6_;
            }
            param1 = param1.children()[0];
         }
         return param1 != null ? this.parseSingleWindowEntity(param1,WindowController(param2),param3) : null;
      }
      
      private function parseSingleWindowEntity(param1:XML, param2:WindowController, param3:Map) : IWindow
      {
         var window:WindowController = null;
         var type:uint = 0;
         var name:String = null;
         var rect:Rectangle = null;
         var node:XML = null;
         var list:XMLList = null;
         var length:uint = 0;
         var i:uint = 0;
         var tags:Array = null;
         var param:String = null;
         var filters:Array = null;
         var iterator:IIterator = null;
         var xml:XML = param1;
         var parent:WindowController = param2;
         var variables:Map = param3;
         var caption:String = parent != null ? parent.caption : "";
         var visible:Boolean = true;
         var clipping:Boolean = true;
         var color:String = "0x00ffffff";
         var blend:Number = 1;
         var background:Boolean = false;
         var treshold:uint = 10;
         var style:uint = parent != null ? uint(parent.style) : uint(0);
         var params:uint = 0;
         var tag:String = "";
         var id:int = 0;
         type = this._typeStringToCodeTable[xml.localName()];
         name = unescape(this.parseAttribute(xml,"name",variables));
         style = uint(this.parseAttribute(xml,"style",variables,style.toString()));
         params = uint(this.parseAttribute(xml,"params",variables,params.toString()));
         tag = unescape(this.parseAttribute(xml,"tags",variables,tag));
         rect = new Rectangle();
         rect.x = Number(this.parseAttribute(xml,"x",variables,"0"));
         rect.y = Number(this.parseAttribute(xml,"y",variables,"0"));
         rect.width = Number(this.parseAttribute(xml,"width",variables,"0"));
         rect.height = Number(this.parseAttribute(xml,"height",variables,"0"));
         visible = this.parseAttribute(xml,"visible",variables,visible.toString()) == "true";
         caption = unescape(this.parseAttribute(xml,"caption",variables,caption));
         id = int(this.parseAttribute(xml,"id",variables,id.toString()));
         if(xml.child("params").length() > 0)
         {
            list = xml.child("params").children();
            length = list.length();
            i = 0;
            while(i < length)
            {
               node = list[i];
               param = this.parseAttribute(node,"name",variables) as String;
               if(this.var_939[param] == null)
               {
                  throw new Error("Unknown window parameter \"" + String(node.attribute("name")) + "\"!");
               }
               params |= this.var_939[param];
               i++;
            }
         }
         if(tag != "")
         {
            tags = tag.split(",");
            length = tags.length;
            i = 0;
            while(i < length)
            {
               tags[i] = WindowParser.trimWhiteSpace(tags[i]);
               i++;
            }
         }
         window = this.var_16.create(name,null,type,style,params,rect,null,parent is IIterable ? null : parent,id,this.parseProperties(xml.child("variables")[0]),tags) as WindowController;
         window.limits.minWidth = int(this.parseAttribute(xml,"width_min",variables,String(int.MIN_VALUE)));
         window.limits.maxWidth = int(this.parseAttribute(xml,"width_max",variables,String(int.MAX_VALUE)));
         window.limits.minHeight = int(this.parseAttribute(xml,"height_min",variables,String(int.MIN_VALUE)));
         window.limits.maxHeight = int(this.parseAttribute(xml,"height_max",variables,String(int.MAX_VALUE)));
         background = this.parseAttribute(xml,"background",variables,window.background.toString()) == "true";
         blend = Number(this.parseAttribute(xml,"blend",variables,window.blend.toString()));
         clipping = this.parseAttribute(xml,"clipping",variables,window.clipping.toString()) == "true";
         color = this.parseAttribute(xml,"color",variables,window.color.toString());
         treshold = uint(this.parseAttribute(xml,"treshold",variables,window.mouseTreshold.toString()));
         if(window.caption != caption)
         {
            window.caption = caption;
         }
         if(window.blend != blend)
         {
            window.blend = blend;
         }
         if(window.visible != visible)
         {
            window.visible = visible;
         }
         if(window.clipping != clipping)
         {
            window.clipping = clipping;
         }
         if(window.background != background)
         {
            window.background = background;
         }
         if(window.mouseTreshold != treshold)
         {
            window.mouseTreshold = treshold;
         }
         var temp:uint = color.charAt(1) == "x" ? uint(parseInt(color,16)) : uint(uint(color));
         if(window.color != temp)
         {
            window.color = temp;
         }
         list = xml.child("filters").children();
         length = list.length();
         if(length > 0)
         {
            filters = new Array();
            i = 0;
            while(i < length)
            {
               filters.push(this.buildBitmapFilter(list[i]));
               i++;
            }
            window.filters = filters;
         }
         if(window != null)
         {
            if(parent != null)
            {
               if(parent is IIterable)
               {
                  if(window.x != rect.x || window.y != rect.y || window.width != rect.width || window.height != rect.height)
                  {
                     if((params & 0) == WindowParam.const_166)
                     {
                        window.x = rect.x;
                     }
                     if((params & 0) == WindowParam.const_187)
                     {
                        window.y = rect.y;
                     }
                  }
                  try
                  {
                     iterator = IIterable(parent).iterator;
                  }
                  catch(e:Error)
                  {
                  }
                  if(iterator != null)
                  {
                     iterator[iterator.length] = window;
                  }
                  else
                  {
                     parent.addChild(window);
                  }
               }
            }
         }
         list = xml.child("children");
         if(list.length() > 0)
         {
            node = list[0];
            list = node.children();
            length = list.length();
            i = 0;
            while(i < length)
            {
               this.parseAndConstruct(list[i],window,variables);
               i++;
            }
         }
         return window;
      }
      
      private function parseAttribute(param1:XML, param2:String, param3:Map, param4:String = "") : String
      {
         var _loc5_:XMLList = param1.attribute(param2);
         if(_loc5_.length() == 0)
         {
            return param4;
         }
         var _loc6_:String = String(_loc5_);
         if(param3 != null)
         {
            if(_loc6_.charAt(0) == "$")
            {
               _loc6_ = param3[_loc6_.slice(1,_loc6_.length)];
               if(_loc6_ == null)
               {
                  throw new Error("Shared variable not defined: \"" + param1.attribute(param2) + "\"!");
               }
            }
         }
         return _loc6_;
      }
      
      private function parseProperties(param1:XML) : Array
      {
         return param1 != null ? XMLPropertyArrayParser.parse(param1.children()) : new Array();
      }
      
      public function windowToXMLString(param1:IWindow) : String
      {
         var _loc8_:* = null;
         var _loc10_:* = null;
         var _loc12_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         var _loc2_:String = "";
         var _loc3_:String = this.var_1173[param1.type];
         var _loc4_:uint = param1.param;
         var _loc5_:uint = param1.style;
         var _loc6_:IRectLimiter = param1.limits;
         var _loc7_:WindowController = param1 as WindowController;
         _loc2_ += "<" + _loc3_ + " x=\"" + param1.x + "\"" + " y=\"" + param1.y + "\"" + " width=\"" + param1.width + "\"" + " height=\"" + param1.height + "\"" + " params=\"" + param1.param + "\"" + " style=\"" + param1.style + "\"" + (param1.name != "" ? " name=\"" + escape(param1.name) + "\"" : "") + (param1.caption != "" ? " caption=\"" + escape(param1.caption) + "\"" : "") + (param1.id != 0 ? " id=\"" + param1.id.toString() + "\"" : "") + (param1.color != 16777215 ? " color=\"0x" + param1.alpha.toString(16) + param1.color.toString(16) + "\"" : "") + (param1.blend != 1 ? " blend=\"" + param1.blend.toString() + "\"" : "") + (param1.visible != true ? " visible=\"" + param1.visible.toString() + "\"" : "") + (param1.clipping != true ? " clipping=\"" + param1.clipping.toString() + "\"" : "") + (param1.background != false ? " background=\"" + param1.background.toString() + "\"" : "") + (param1.mouseTreshold != 10 ? " treshold=\"" + param1.mouseTreshold.toString() + "\"" : "") + (param1.tags.length > 0 ? " tags=\"" + escape(param1.tags.toString()) + "\"" : "") + (_loc6_.minWidth > int.MIN_VALUE ? " width_min=\"" + _loc6_.minWidth + "\"" : "") + (_loc6_.maxWidth < int.MAX_VALUE ? " width_max=\"" + _loc6_.maxWidth + "\"" : "") + (_loc6_.minHeight > int.MIN_VALUE ? " height_min=\"" + _loc6_.minHeight + "\"" : "") + (_loc6_.maxHeight < int.MAX_VALUE ? " height_max=\"" + _loc6_.maxHeight + "\"" : "") + ">\r";
         var _loc9_:uint = _loc7_.numChildren;
         var _loc11_:String = "";
         if(_loc7_ is IIterable)
         {
            _loc8_ = IIterable(_loc7_).iterator;
            _loc9_ = _loc8_.length;
            if(_loc9_ > 0)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc9_)
               {
                  _loc10_ = _loc8_[_loc12_] as IWindow;
                  if(_loc10_.tags.indexOf(WindowParser.const_906) == -1)
                  {
                     _loc11_ += this.windowToXMLString(_loc10_);
                  }
                  _loc12_++;
               }
            }
         }
         else
         {
            _loc9_ = _loc7_.numChildren;
            if(_loc9_ > 0)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc9_)
               {
                  _loc10_ = _loc7_.getChildAt(_loc12_);
                  if(_loc10_.tags.indexOf(WindowParser.const_906) == -1)
                  {
                     _loc11_ += this.windowToXMLString(_loc10_);
                  }
                  _loc12_++;
               }
            }
         }
         if(_loc11_.length > 0)
         {
            _loc2_ += "\t<children>\r" + _loc11_ + "\t</children>\r";
         }
         var _loc13_:Array = param1.properties;
         if(_loc13_ != null && _loc13_.length > 0)
         {
            _loc15_ = "\t<variables>\r";
            _loc16_ = false;
            _loc12_ = 0;
            while(_loc12_ < _loc13_.length)
            {
               _loc14_ = _loc13_[_loc12_] as PropertyStruct;
               if(_loc14_.valid)
               {
                  _loc15_ += "\t\t" + _loc14_.toXMLString() + "\r";
                  _loc16_ = true;
               }
               _loc12_++;
            }
            _loc15_ += "\t</variables>\r";
            if(_loc16_)
            {
               _loc2_ += _loc15_;
            }
         }
         return _loc2_ + ("</" + _loc3_ + ">\r");
      }
      
      private function buildBitmapFilter(param1:XML) : BitmapFilter
      {
         var _loc3_:* = null;
         var _loc2_:String = param1.localName() as String;
         switch(_loc2_)
         {
            case "DropShadowFilter":
               _loc3_ = new DropShadowFilter(Number(this.parseAttribute(param1,"distance",null,"0")),Number(this.parseAttribute(param1,"angle",null,"45")),uint(this.parseAttribute(param1,"color",null,"0")),Number(this.parseAttribute(param1,"alpha",null,"1")),Number(this.parseAttribute(param1,"blurX",null,"0")),Number(this.parseAttribute(param1,"blurY",null,"0")),Number(this.parseAttribute(param1,"strength",null,"1")),int(this.parseAttribute(param1,"quality",null,"1")),Boolean(this.parseAttribute(param1,"inner",null,"false") == "true"),Boolean(this.parseAttribute(param1,"knockout",null,"false") == "true"),Boolean(this.parseAttribute(param1,"hideObject",null,"false") == "true"));
         }
         return _loc3_;
      }
   }
}
