package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class GraphicAssetCollection implements IGraphicAssetCollection
   {
       
      
      private var _assets:Dictionary;
      
      private var var_473:IAssetLibrary;
      
      public function GraphicAssetCollection()
      {
         super();
         this._assets = new Dictionary();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for(_loc1_ in this._assets)
         {
            _loc2_ = this._assets[_loc1_];
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            delete this._assets[_loc1_];
         }
         this._assets = null;
         this.var_473 = null;
      }
      
      public function set assetLibrary(param1:IAssetLibrary) : void
      {
         this.var_473 = param1;
      }
      
      public function define(param1:XML) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.asset;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length())
         {
            _loc4_ = _loc2_[_loc3_].@name;
            if(_loc4_.length() > 0)
            {
               _loc5_ = _loc4_;
               _loc6_ = _loc5_;
               _loc7_ = false;
               _loc8_ = false;
               _loc9_ = 0;
               _loc10_ = 0;
               _loc4_ = _loc2_[_loc3_].@x;
               if(_loc4_.length() > 0)
               {
                  _loc9_ = -int(_loc4_);
               }
               _loc4_ = _loc2_[_loc3_].@y;
               if(_loc4_.length() > 0)
               {
                  _loc10_ = -int(_loc4_);
               }
               _loc4_ = _loc2_[_loc3_].@source;
               if(_loc4_.length() > 0)
               {
                  _loc6_ = _loc4_;
               }
               _loc4_ = _loc2_[_loc3_].@flipH;
               if(_loc4_.length() > 0)
               {
                  if(int(_loc4_) > 0)
                  {
                     _loc4_ = _loc2_[_loc3_].@source;
                     if(_loc4_.length() > 0)
                     {
                        _loc6_ = _loc4_;
                        _loc7_ = true;
                     }
                  }
               }
               _loc4_ = _loc2_[_loc3_].@flipV;
               if(_loc4_.length() > 0)
               {
                  if(int(_loc4_) > 0)
                  {
                     _loc4_ = _loc2_[_loc3_].@source;
                     if(_loc4_.length() > 0)
                     {
                        _loc6_ = _loc4_;
                        _loc8_ = true;
                     }
                  }
               }
               _loc11_ = this.var_473.getAssetByName(_loc6_);
               _loc12_ = this.createAsset(_loc5_,_loc11_,_loc7_,_loc8_,_loc9_,_loc10_);
               if(!_loc12_)
               {
                  _loc12_ = this.replaceAsset(_loc5_,_loc11_,_loc7_,_loc8_,_loc9_,_loc10_);
               }
            }
            _loc3_++;
         }
         return true;
      }
      
      protected function createAsset(param1:String, param2:IAsset, param3:Boolean, param4:Boolean, param5:Number, param6:Number) : Boolean
      {
         if(this._assets[param1] != null)
         {
            return false;
         }
         var _loc7_:GraphicAsset = new GraphicAsset(param1,param2,param3,param4,param5,param6);
         this._assets[param1] = _loc7_;
         return true;
      }
      
      protected function replaceAsset(param1:String, param2:IAsset, param3:Boolean, param4:Boolean, param5:Number, param6:Number) : Boolean
      {
         var _loc7_:GraphicAsset = this._assets[param1];
         if(_loc7_ != null)
         {
            _loc7_.dispose();
            delete this._assets[param1];
         }
         return this.createAsset(param1,param2,param3,param4,param5,param6);
      }
      
      public function getAsset(param1:String) : IGraphicAsset
      {
         return this._assets[param1];
      }
      
      public function addAsset(param1:String, param2:BitmapData, param3:Boolean, param4:int = 0, param5:int = 0) : Boolean
      {
         var _loc7_:* = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         if(this.var_473 == null)
         {
            return false;
         }
         var _loc6_:BitmapDataAsset = this.var_473.getAssetByName(param1) as BitmapDataAsset;
         if(_loc6_ == null)
         {
            _loc6_ = new BitmapDataAsset(this.var_473.getAssetTypeDeclarationByClass(BitmapDataAsset));
            this.var_473.setAsset(param1,_loc6_);
            _loc6_.setUnknownContent(param2);
            return this.createAsset(param1,_loc6_,false,false,param4,param5);
         }
         if(param3)
         {
            _loc7_ = _loc6_.content as BitmapData;
            if(_loc7_ != null && _loc7_ != param2)
            {
               _loc7_.dispose();
            }
            _loc6_.setUnknownContent(param2);
         }
         return false;
      }
      
      public function disposeAsset(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:BitmapDataAsset = this.var_473.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ != null)
         {
            this.var_473.removeAsset(_loc2_);
            _loc2_.dispose();
            _loc3_ = this._assets[param1];
            if(_loc3_ != null)
            {
               _loc3_.dispose();
               delete this._assets[param1];
            }
         }
      }
   }
}
