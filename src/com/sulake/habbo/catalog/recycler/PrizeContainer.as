package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_2360:String;
      
      private var var_1673:int;
      
      private var var_2359:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_2667:PrizeGridItem;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         this.var_2360 = param1;
         this.var_1673 = param2;
         this._furnitureData = param3;
         this.var_2359 = param4;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         initProductIcon(param1,this._furnitureData.type,this.var_1673);
      }
      
      public function get productItemType() : String
      {
         return this.var_2360;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1673;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return this.var_2667;
      }
      
      public function get oddsLevelId() : int
      {
         return this.var_2359;
      }
      
      public function get title() : String
      {
         if(this._furnitureData == null)
         {
            return "";
         }
         return this._furnitureData.title;
      }
   }
}
