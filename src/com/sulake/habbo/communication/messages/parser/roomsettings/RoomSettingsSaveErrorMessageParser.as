package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1742:int = 1;
      
      public static const const_1680:int = 2;
      
      public static const const_1635:int = 3;
      
      public static const const_1781:int = 4;
      
      public static const const_1254:int = 5;
      
      public static const const_1762:int = 6;
      
      public static const const_1484:int = 7;
      
      public static const const_1473:int = 8;
      
      public static const const_1682:int = 9;
      
      public static const const_1413:int = 10;
      
      public static const const_1371:int = 11;
      
      public static const const_1268:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1444:int;
      
      private var var_1405:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1444 = param1.readInteger();
         this.var_1405 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1444;
      }
      
      public function get info() : String
      {
         return this.var_1405;
      }
   }
}
