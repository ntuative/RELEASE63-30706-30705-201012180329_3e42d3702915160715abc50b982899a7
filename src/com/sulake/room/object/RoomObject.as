package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_972:int = 0;
       
      
      private var _id:int;
      
      private var _type:String = "";
      
      private var var_72:Vector3d;
      
      private var var_222:Vector3d;
      
      private var var_1493:Vector3d;
      
      private var var_1494:Vector3d;
      
      private var var_532:Array;
      
      private var var_62:RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_533:IRoomObjectEventHandler;
      
      private var _updateID:int;
      
      private var _instanceId:int = 0;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         this._id = param1;
         this.var_72 = new Vector3d();
         this.var_222 = new Vector3d();
         this.var_1493 = new Vector3d();
         this.var_1494 = new Vector3d();
         this.var_532 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            this.var_532[_loc3_] = 0;
            _loc3_--;
         }
         this.var_62 = new RoomObjectModel();
         this._visualization = null;
         this.var_533 = null;
         this._updateID = 0;
         this._instanceId = var_972++;
      }
      
      public function dispose() : void
      {
         this.var_72 = null;
         this.var_222 = null;
         if(this.var_62 != null)
         {
            this.var_62.dispose();
            this.var_62 = null;
         }
         this.var_532 = null;
         this.setVisualization(null);
         this.setEventHandler(null);
      }
      
      public function getId() : int
      {
         return this._id;
      }
      
      public function getType() : String
      {
         return this._type;
      }
      
      public function getInstanceId() : int
      {
         return this._instanceId;
      }
      
      public function getLocation() : IVector3d
      {
         this.var_1493.assign(this.var_72);
         return this.var_1493;
      }
      
      public function getDirection() : IVector3d
      {
         this.var_1494.assign(this.var_222);
         return this.var_1494;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return this.var_62;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return this.var_62;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.var_532.length)
         {
            return this.var_532[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return this._visualization;
      }
      
      public function setType(param1:String) : void
      {
         this._type = param1;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_72.x != param1.x || this.var_72.y != param1.y || this.var_72.z != param1.z)
         {
            this.var_72.x = param1.x;
            this.var_72.y = param1.y;
            this.var_72.z = param1.z;
            ++this._updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_222.x != param1.x || this.var_222.y != param1.y || this.var_222.z != param1.z)
         {
            this.var_222.x = (param1.x % 360 + 360) % 360;
            this.var_222.y = (param1.y % 360 + 360) % 360;
            this.var_222.z = (param1.z % 360 + 360) % 360;
            ++this._updateID;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < this.var_532.length)
         {
            if(this.var_532[param2] != param1)
            {
               this.var_532[param2] = param1;
               ++this._updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != this._visualization)
         {
            if(this._visualization != null)
            {
               this._visualization.dispose();
            }
            this._visualization = param1;
            if(this._visualization != null)
            {
               this._visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == this.var_533)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = this.var_533;
         if(_loc2_ != null)
         {
            this.var_533 = null;
            _loc2_.object = null;
         }
         this.var_533 = param1;
         if(this.var_533 != null)
         {
            this.var_533.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return this.var_533;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return this.getEventHandler();
      }
   }
}
