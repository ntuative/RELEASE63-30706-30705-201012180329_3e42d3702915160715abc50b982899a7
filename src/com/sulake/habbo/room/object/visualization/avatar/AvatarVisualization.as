package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_826:String = "avatar";
      
      private static const const_543:Number = -0.01;
      
      private static const const_544:Number = -0.409;
      
      private static const const_828:int = 2;
      
      private static const const_1145:Array = [0,0,0];
      
      private static const const_1143:int = 3;
       
      
      private var var_525:AvatarVisualizationData = null;
      
      private var var_430:Map;
      
      private var var_428:Map;
      
      private var var_964:int = 0;
      
      private var var_779:Boolean;
      
      private var var_568:String;
      
      private var var_854:String;
      
      private var var_963:int = 0;
      
      private var var_524:BitmapDataAsset;
      
      private var var_790:BitmapDataAsset;
      
      private var var_1471:int = -1;
      
      private var var_1466:int = -1;
      
      private var var_1468:int = -1;
      
      private const const_827:int = 0;
      
      private const const_1544:int = 1;
      
      private const const_1542:int = 2;
      
      private const const_1543:int = 3;
      
      private const const_1144:int = 4;
      
      private var var_1489:int = -1;
      
      private var var_221:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1467:Boolean = false;
      
      private var var_1472:Boolean = false;
      
      private var var_1470:Boolean = false;
      
      private var var_1202:Boolean = false;
      
      private var var_598:Boolean = false;
      
      private var var_1204:int = 0;
      
      private var var_1205:int = 0;
      
      private var var_1998:int = 0;
      
      private var var_634:int = 0;
      
      private var var_635:int = 0;
      
      private var var_526:int = 0;
      
      private var var_1203:int = 0;
      
      private var var_960:Boolean = false;
      
      private var var_1469:Boolean = false;
      
      private var var_961:int = 0;
      
      private var var_636:int = 0;
      
      private var var_1465:Boolean = false;
      
      private var var_959:int = 0;
      
      private var var_51:IAvatarImage = null;
      
      private var var_693:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_430 = new Map();
         this.var_428 = new Map();
         this.var_779 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_430 != null)
         {
            this.resetImages();
            this.var_430.dispose();
            this.var_428.dispose();
            this.var_430 = null;
         }
         this.var_525 = null;
         this.var_524 = null;
         this.var_790 = null;
         super.dispose();
         this.var_693 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_525 = param1 as AvatarVisualizationData;
         createSprites(this.const_1144);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_216)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_256) > 0 && param3);
            if(_loc5_ != this.var_1467)
            {
               this.var_1467 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_221) > 0;
            if(_loc5_ != this.var_1472)
            {
               this.var_1472 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_428) > 0;
            if(_loc5_ != this.var_1470)
            {
               this.var_1470 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_723) > 0 && param3);
            if(_loc5_ != this.var_1202)
            {
               this.var_1202 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1024) > 0;
            if(_loc5_ != this.var_598)
            {
               this.var_598 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_293);
            if(_loc6_ != this.var_1204)
            {
               this.var_1204 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_487);
            if(_loc7_ != this.var_221)
            {
               this.var_221 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_767);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1002);
            if(_loc6_ != this.var_1205)
            {
               this.var_1205 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_523);
            if(_loc6_ != this.var_634)
            {
               this.var_634 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_446);
            if(_loc6_ != this.var_635)
            {
               this.var_635 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_328);
            if(_loc6_ != this.var_526)
            {
               this.var_526 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_371);
            if(_loc6_ != this.var_1471)
            {
               this.var_1471 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_635 > 0 && param1.getNumber(RoomObjectVariableEnum.const_328) > 0)
            {
               if(this.var_526 != this.var_635)
               {
                  this.var_526 = this.var_635;
                  _loc4_ = true;
               }
            }
            else if(this.var_526 != 0)
            {
               this.var_526 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_702);
            if(_loc6_ != this.var_961)
            {
               this.var_961 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1081);
            if(_loc7_ != this.var_854)
            {
               this.var_854 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_186);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_216 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_568 != param1)
         {
            this.var_568 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_430)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_428)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_430.reset();
         this.var_428.reset();
         this.var_51 = null;
         _loc2_ = getSprite(this.const_827);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1202 = false;
         }
         if(this.var_221 == "sit" || this.var_221 == "lay")
         {
            this.var_1203 = param1 / 2;
         }
         else
         {
            this.var_1203 = 0;
         }
         this.var_1469 = false;
         this.var_960 = false;
         if(this.var_221 == "lay")
         {
            this.var_960 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1469 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_430.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_428.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_525.getAvatar(this.var_568,param1,this.var_854,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_430.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_428.length >= const_1143)
                  {
                     this.var_428.remove(this.var_428.getKeys().shift());
                  }
                  this.var_428.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_351 != param1.getUpdateID() || this.var_1489 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1471;
            if(this.var_221 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1466 || param4)
            {
               _loc5_ = true;
               this.var_1466 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_51.setDirectionAngle(AvatarSetType.const_32,_loc6_);
            }
            if(_loc7_ != this.var_1468 || param4)
            {
               _loc5_ = true;
               this.var_1468 = _loc7_;
               if(this.var_1468 != this.var_1466)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_51.setDirectionAngle(AvatarSetType.const_42,_loc7_);
               }
            }
            var_351 = param1.getUpdateID();
            this.var_1489 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1544);
         this.var_524 = null;
         if(this.var_221 == "mv" || this.var_221 == "std")
         {
            _loc2_.visible = true;
            if(this.var_524 == null || param1 != var_215)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_524 = this.var_51.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_524 = this.var_51.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_524 != null)
               {
                  _loc2_.asset = this.var_524.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_524 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_790 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1542);
         if(this.var_598)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_790 = this.var_525.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_790 = this.var_525.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_221 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_221 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_790 != null)
            {
               _loc2_.asset = this.var_790.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1543);
         if(this.var_961 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_525.getAvatarRendererAsset("number_" + this.var_961 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_525.getAvatarRendererAsset("number_" + this.var_961 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_221 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_221 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_636 = 1;
               this.var_1465 = true;
               this.var_959 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_636 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1543);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1465)
         {
            ++this.var_959;
            if(this.var_959 < 10)
            {
               return false;
            }
            if(this.var_636 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_959 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_636 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_636 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_636 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_636 = 0;
               this.var_1465 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_525 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = this.var_634;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc12_ || _loc6_ != var_215 || this.var_51 == null)
         {
            if(_loc6_ != var_215)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc10_ != this.var_634)
            {
               _loc11_ = true;
            }
            if(_loc8_ || this.var_51 == null || _loc11_)
            {
               this.var_51 = this.getAvatarImage(_loc6_,this.var_634);
               if(this.var_51 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc15_ = getSprite(this.const_827);
               if(_loc15_ && this.var_51 && this.var_51.isPlaceholder())
               {
                  _loc15_.alpha = 150;
               }
               else if(_loc15_)
               {
                  _loc15_.alpha = 255;
               }
            }
            if(this.var_51 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_51);
            var_215 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc13_:Boolean = _loc9_ || _loc12_ || _loc8_;
         var _loc14_:Boolean = (this.var_779 || this.var_963 > 0) && param3;
         if(_loc13_)
         {
            this.var_963 = const_828;
         }
         if(_loc13_ || _loc14_)
         {
            increaseUpdateId();
            --this.var_963;
            --this.var_964;
            if(!(this.var_964 <= 0 || _loc8_ || _loc12_ || _loc7_))
            {
               return;
            }
            this.var_51.updateAnimationByFrames(1);
            this.var_964 = const_828;
            _loc17_ = this.var_51.getCanvasOffsets();
            if(_loc17_ == null || _loc17_.length < 3)
            {
               _loc17_ = const_1145;
            }
            _loc16_ = getSprite(this.const_827);
            if(_loc16_ != null)
            {
               _loc20_ = this.var_51.getImage(AvatarSetType.const_32,false);
               if(_loc20_ != null)
               {
                  _loc16_.asset = _loc20_;
               }
               if(_loc16_.asset)
               {
                  _loc16_.offsetX = -1 * _loc6_ / 2 + _loc17_[0];
                  _loc16_.offsetY = -_loc16_.asset.height + _loc6_ / 4 + _loc17_[1] + this.var_1203;
               }
               if(this.var_960)
               {
                  if(this.var_1469)
                  {
                     _loc16_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc16_.relativeDepth = const_544 + _loc17_[2];
                  }
               }
               else
               {
                  _loc16_.relativeDepth = const_543 + _loc17_[2];
               }
            }
            _loc16_ = getSprite(this.const_1542);
            if(_loc16_ != null && _loc16_.visible)
            {
               if(!this.var_960)
               {
                  _loc16_.relativeDepth = const_543 - 0.01 + _loc17_[2];
               }
               else
               {
                  _loc16_.relativeDepth = const_544 - 0.01 + _loc17_[2];
               }
            }
            this.var_779 = this.var_51.isAnimating();
            _loc18_ = this.const_1144;
            for each(_loc19_ in this.var_51.getSprites())
            {
               if(_loc19_.id == const_826)
               {
                  _loc16_ = getSprite(this.const_827);
                  _loc21_ = this.var_51.getLayerData(_loc19_);
                  _loc22_ = _loc19_.getDirectionOffsetX(this.var_51.getDirection());
                  _loc23_ = _loc19_.getDirectionOffsetY(this.var_51.getDirection());
                  if(_loc21_ != null)
                  {
                     _loc22_ += _loc21_.dx;
                     _loc23_ += _loc21_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  _loc16_.offsetX += _loc22_;
                  _loc16_.offsetY += _loc23_;
               }
               else
               {
                  _loc16_ = getSprite(_loc18_);
                  if(_loc16_ != null)
                  {
                     _loc16_.capturesMouse = false;
                     _loc16_.visible = true;
                     _loc24_ = this.var_51.getLayerData(_loc19_);
                     _loc25_ = 0;
                     _loc26_ = _loc19_.getDirectionOffsetX(this.var_51.getDirection());
                     _loc27_ = _loc19_.getDirectionOffsetY(this.var_51.getDirection());
                     _loc28_ = _loc19_.getDirectionOffsetZ(this.var_51.getDirection());
                     _loc29_ = 0;
                     if(_loc19_.hasDirections)
                     {
                        _loc29_ = this.var_51.getDirection();
                     }
                     if(_loc24_ != null)
                     {
                        _loc25_ = _loc24_.animationFrame;
                        _loc26_ += _loc24_.dx;
                        _loc27_ += _loc24_.dy;
                        _loc29_ += _loc24_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc26_ /= 2;
                        _loc27_ /= 2;
                     }
                     if(_loc29_ < 0)
                     {
                        _loc29_ += 8;
                     }
                     else if(_loc29_ > 7)
                     {
                        _loc29_ -= 8;
                     }
                     _loc30_ = this.var_51.getScale() + "_" + _loc19_.member + "_" + _loc29_ + "_" + _loc25_;
                     _loc31_ = this.var_51.getAsset(_loc30_);
                     if(_loc31_ == null)
                     {
                        continue;
                     }
                     _loc16_.asset = _loc31_.content as BitmapData;
                     _loc16_.offsetX = -_loc31_.offset.x - _loc6_ / 2 + _loc26_;
                     _loc16_.offsetY = -_loc31_.offset.y + _loc27_ + this.var_1203;
                     if(this.var_960)
                     {
                        _loc16_.relativeDepth = const_544 - 0.001 * spriteCount * _loc28_;
                     }
                     else
                     {
                        _loc16_.relativeDepth = const_543 - 0.001 * spriteCount * _loc28_;
                     }
                     if(_loc19_.ink == 33)
                     {
                        _loc16_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc16_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc18_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_354,this.var_221,this._postureParameter);
         if(this.var_1204 > 0)
         {
            param1.appendAction(AvatarAction.const_261,AvatarAction.const_1394[this.var_1204]);
         }
         if(this.var_1205 > 0)
         {
            param1.appendAction(AvatarAction.const_813,this.var_1205);
         }
         if(this.var_1998 > 0)
         {
            param1.appendAction(AvatarAction.const_754,this.var_1998);
         }
         if(this.var_635 > 0)
         {
            param1.appendAction(AvatarAction.const_679,this.var_635);
         }
         if(this.var_526 > 0)
         {
            param1.appendAction(AvatarAction.const_606,this.var_526);
         }
         if(this.var_1467)
         {
            param1.appendAction(AvatarAction.const_267);
         }
         if(this.var_1470 || this.var_1202)
         {
            param1.appendAction(AvatarAction.const_425);
         }
         if(this.var_1472)
         {
            param1.appendAction(AvatarAction.const_220);
         }
         if(this.var_634 > 0)
         {
            param1.appendAction(AvatarAction.const_264,this.var_634);
         }
         param1.endActionAppends();
         this.var_779 = param1.isAnimating();
         var _loc2_:int = this.const_1144;
         for each(_loc3_ in this.var_51.getSprites())
         {
            if(_loc3_.id != const_826)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
