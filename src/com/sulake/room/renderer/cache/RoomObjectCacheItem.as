package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_896:RoomObjectLocationCacheItem = null;
      
      private var var_177:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_896 = new RoomObjectLocationCacheItem(param1);
         this.var_177 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_896;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_177;
      }
      
      public function dispose() : void
      {
         if(this.var_896 != null)
         {
            this.var_896.dispose();
            this.var_896 = null;
         }
         if(this.var_177 != null)
         {
            this.var_177.dispose();
            this.var_177 = null;
         }
      }
   }
}
