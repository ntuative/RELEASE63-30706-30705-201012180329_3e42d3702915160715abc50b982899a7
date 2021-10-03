package com.sulake.habbo.room.object
{
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
   import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualizationData;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureBottleVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureCounterClockVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureCuboidVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureFireworksVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureGiftWrappedVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureHabboWheelVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurniturePartyBeamerVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurniturePlanetSystemVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurniturePosterVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureQueueTileVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureScoreBoardVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureValRandomizerVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureWaterAreaVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.ResettingAnimatedFurnitureVisualization;
   import com.sulake.habbo.room.object.visualization.pet.PetVisualization;
   import com.sulake.habbo.room.object.visualization.pet.PetVisualizationData;
   import com.sulake.habbo.room.object.visualization.room.RoomVisualization;
   import com.sulake.habbo.room.object.visualization.room.RoomVisualizationData;
   import com.sulake.habbo.room.object.visualization.room.publicroom.PublicRoomParkVisualization;
   import com.sulake.habbo.room.object.visualization.room.publicroom.PublicRoomPoolVisualization;
   import com.sulake.habbo.room.object.visualization.room.publicroom.PublicRoomVisualization;
   import com.sulake.habbo.room.object.visualization.room.publicroom.PublicRoomVisualizationData;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.GraphicAssetCollection;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomObjectVisualizationFactory extends Component implements IRoomObjectVisualizationFactory
   {
       
      
      private var var_980:IAvatarRenderManager = null;
      
      private var _visualizationDatas:Map;
      
      private var var_2050:Boolean = true;
      
      public function RoomObjectVisualizationFactory(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         this.var_2050 = param2 == 0;
         this._visualizationDatas = new Map();
         queueInterface(new IIDAvatarRenderManager(),this.avatarReady);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         super.dispose();
         if(this.var_980 != null)
         {
            release(new IIDAvatarRenderManager());
            this.var_980 = null;
         }
         if(this._visualizationDatas != null)
         {
            _loc1_ = null;
            _loc2_ = 0;
            while(_loc2_ < this._visualizationDatas.length)
            {
               _loc1_ = this._visualizationDatas.getWithIndex(_loc2_) as IRoomObjectVisualizationData;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            this._visualizationDatas.dispose();
            this._visualizationDatas = null;
         }
      }
      
      private function avatarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_980 = param2 as IAvatarRenderManager;
      }
      
      public function createRoomObjectVisualization(param1:String) : IRoomObjectGraphicVisualization
      {
         Logger.log("Creating room object visualization instance of type: " + param1);
         var _loc2_:* = null;
         switch(param1)
         {
            case RoomObjectVisualizationEnum.const_222:
               _loc2_ = RoomVisualization;
               break;
            case RoomObjectVisualizationEnum.const_283:
               _loc2_ = PublicRoomVisualization;
               break;
            case RoomObjectVisualizationEnum.const_272:
               _loc2_ = PublicRoomParkVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1021:
               _loc2_ = PublicRoomPoolVisualization;
               break;
            case RoomObjectVisualizationEnum.const_179:
               _loc2_ = AvatarVisualization;
               break;
            case RoomObjectVisualizationEnum.BOT:
               _loc2_ = AvatarVisualization;
               break;
            case RoomObjectVisualizationEnum.const_66:
               _loc2_ = PetVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1108:
               _loc2_ = FurnitureVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1036:
               _loc2_ = AnimatedFurnitureVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1102:
               _loc2_ = ResettingAnimatedFurnitureVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1071:
               _loc2_ = FurniturePosterVisualization;
               break;
            case RoomObjectVisualizationEnum.const_289:
               _loc2_ = FurnitureHabboWheelVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1098:
               _loc2_ = FurnitureValRandomizerVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1111:
               _loc2_ = FurnitureBottleVisualization;
               break;
            case RoomObjectVisualizationEnum.const_275:
               _loc2_ = FurniturePlanetSystemVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1059:
               _loc2_ = FurnitureQueueTileVisualization;
               break;
            case RoomObjectVisualizationEnum.const_995:
               _loc2_ = FurniturePartyBeamerVisualization;
               break;
            case RoomObjectVisualizationEnum.const_1410:
               _loc2_ = FurnitureCuboidVisualization;
               break;
            case RoomObjectVisualizationEnum.const_982:
               _loc2_ = FurnitureGiftWrappedVisualization;
               break;
            case RoomObjectVisualizationEnum.const_280:
               _loc2_ = FurnitureCounterClockVisualization;
               break;
            case RoomObjectVisualizationEnum.const_937:
               _loc2_ = FurnitureWaterAreaVisualization;
               break;
            case RoomObjectVisualizationEnum.const_263:
               _loc2_ = FurnitureScoreBoardVisualization;
               break;
            case RoomObjectVisualizationEnum.const_260:
               _loc2_ = FurnitureFireworksVisualization;
         }
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:Object = new _loc2_();
         if(_loc3_ is IRoomObjectGraphicVisualization)
         {
            return _loc3_ as IRoomObjectGraphicVisualization;
         }
         return null;
      }
      
      public function getRoomObjectVisualizationData(param1:String, param2:String, param3:XML) : IRoomObjectVisualizationData
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc4_:* = null;
         _loc4_ = this._visualizationDatas.getValue(param1) as IRoomObjectVisualizationData;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         var _loc5_:* = null;
         switch(param2)
         {
            case RoomObjectVisualizationEnum.const_1021:
            case RoomObjectVisualizationEnum.const_272:
            case RoomObjectVisualizationEnum.const_283:
               _loc5_ = PublicRoomVisualizationData;
               break;
            case RoomObjectVisualizationEnum.const_222:
               _loc5_ = RoomVisualizationData;
               break;
            case RoomObjectVisualizationEnum.const_179:
               _loc5_ = AvatarVisualizationData;
               break;
            case RoomObjectVisualizationEnum.BOT:
               _loc5_ = AvatarVisualizationData;
               break;
            case RoomObjectVisualizationEnum.const_66:
               _loc5_ = PetVisualizationData;
               break;
            case RoomObjectVisualizationEnum.const_1108:
            case RoomObjectVisualizationEnum.const_982:
               _loc5_ = FurnitureVisualizationData;
               break;
            case RoomObjectVisualizationEnum.const_1071:
            case RoomObjectVisualizationEnum.const_1036:
            case RoomObjectVisualizationEnum.const_1102:
            case RoomObjectVisualizationEnum.const_289:
            case RoomObjectVisualizationEnum.const_1098:
            case RoomObjectVisualizationEnum.const_1111:
            case RoomObjectVisualizationEnum.const_275:
            case RoomObjectVisualizationEnum.const_1059:
            case RoomObjectVisualizationEnum.const_995:
            case RoomObjectVisualizationEnum.const_280:
            case RoomObjectVisualizationEnum.const_937:
            case RoomObjectVisualizationEnum.const_263:
            case RoomObjectVisualizationEnum.const_260:
               _loc5_ = AnimatedFurnitureVisualizationData;
         }
         if(_loc5_ == null)
         {
            return null;
         }
         _loc4_ = new _loc5_();
         if(_loc4_ != null)
         {
            _loc6_ = null;
            _loc6_ = _loc4_ as IRoomObjectVisualizationData;
            if(!_loc6_.initialize(param3))
            {
               _loc6_.dispose();
               return null;
            }
            if(_loc6_ is AvatarVisualizationData)
            {
               _loc7_ = _loc4_ as AvatarVisualizationData;
               _loc7_.avatarRenderer = this.var_980;
            }
            else if(_loc6_ is PetVisualizationData)
            {
               _loc8_ = _loc4_ as PetVisualizationData;
               _loc8_.avatarRenderer = this.var_980;
            }
            if(this.var_2050)
            {
               this._visualizationDatas.add(param1,_loc6_);
            }
            return _loc6_;
         }
         return null;
      }
      
      public function createGraphicAssetCollection() : IGraphicAssetCollection
      {
         return new GraphicAssetCollection();
      }
   }
}
