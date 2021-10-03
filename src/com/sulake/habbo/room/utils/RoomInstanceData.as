package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_741:TileHeightMap = null;
      
      private var var_1116:LegacyWallGeometry = null;
      
      private var var_1117:RoomCamera = null;
      
      private var var_742:SelectedRoomObjectData = null;
      
      private var var_743:SelectedRoomObjectData = null;
      
      private var var_2535:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1116 = new LegacyWallGeometry();
         this.var_1117 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_741;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_741 != null)
         {
            this.var_741.dispose();
         }
         this.var_741 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1116;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1117;
      }
      
      public function get worldType() : String
      {
         return this.var_2535;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2535 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_742;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_742 != null)
         {
            this.var_742.dispose();
         }
         this.var_742 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_743;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_743 != null)
         {
            this.var_743.dispose();
         }
         this.var_743 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_741 != null)
         {
            this.var_741.dispose();
            this.var_741 = null;
         }
         if(this.var_1116 != null)
         {
            this.var_1116.dispose();
            this.var_1116 = null;
         }
         if(this.var_1117 != null)
         {
            this.var_1117.dispose();
            this.var_1117 = null;
         }
         if(this.var_742 != null)
         {
            this.var_742.dispose();
            this.var_742 = null;
         }
         if(this.var_743 != null)
         {
            this.var_743.dispose();
            this.var_743 = null;
         }
      }
   }
}
