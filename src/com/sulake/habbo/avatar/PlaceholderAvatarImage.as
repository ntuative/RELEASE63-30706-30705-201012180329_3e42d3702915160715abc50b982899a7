package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_678:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_693)
         {
            _structure = null;
            _assets = null;
            var_223 = null;
            var_256 = null;
            var_568 = null;
            var_514 = null;
            var_289 = null;
            if(!var_1172 && var_39)
            {
               var_39.dispose();
            }
            var_39 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_680 = null;
            var_693 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_678[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_678[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_354:
               switch(_loc3_)
               {
                  case AvatarAction.const_693:
                  case AvatarAction.const_531:
                  case AvatarAction.const_322:
                  case AvatarAction.const_790:
                  case AvatarAction.const_326:
                  case AvatarAction.const_687:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_264:
            case AvatarAction.const_813:
            case AvatarAction.const_220:
            case AvatarAction.const_754:
            case AvatarAction.const_679:
            case AvatarAction.const_606:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
