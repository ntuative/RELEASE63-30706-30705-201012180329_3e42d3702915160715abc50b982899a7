package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_980:int = 1;
      
      public static const const_672:int = 2;
      
      public static const const_617:int = 3;
      
      public static const const_1450:int = 4;
       
      
      private var _index:int;
      
      private var var_2162:String;
      
      private var var_2164:String;
      
      private var var_2165:Boolean;
      
      private var var_2167:String;
      
      private var var_861:String;
      
      private var var_2161:int;
      
      private var var_2163:int;
      
      private var _type:int;
      
      private var var_2166:String;
      
      private var var_829:GuestRoomData;
      
      private var var_830:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2162 = param1.readString();
         this.var_2164 = param1.readString();
         this.var_2165 = param1.readInteger() == 1;
         this.var_2167 = param1.readString();
         this.var_861 = param1.readString();
         this.var_2161 = param1.readInteger();
         this.var_2163 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_980)
         {
            this.var_2166 = param1.readString();
         }
         else if(this._type == const_617)
         {
            this.var_830 = new PublicRoomData(param1);
         }
         else if(this._type == const_672)
         {
            this.var_829 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_829 != null)
         {
            this.var_829.dispose();
            this.var_829 = null;
         }
         if(this.var_830 != null)
         {
            this.var_830.dispose();
            this.var_830 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2162;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2164;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2165;
      }
      
      public function get picText() : String
      {
         return this.var_2167;
      }
      
      public function get picRef() : String
      {
         return this.var_861;
      }
      
      public function get folderId() : int
      {
         return this.var_2161;
      }
      
      public function get tag() : String
      {
         return this.var_2166;
      }
      
      public function get userCount() : int
      {
         return this.var_2163;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_829;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_830;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_980)
         {
            return 0;
         }
         if(this.type == const_672)
         {
            return this.var_829.maxUserCount;
         }
         if(this.type == const_617)
         {
            return this.var_830.maxUsers;
         }
         return 0;
      }
   }
}
