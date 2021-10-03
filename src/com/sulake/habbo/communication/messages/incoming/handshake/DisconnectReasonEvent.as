package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1638:int = 0;
      
      public static const const_1352:int = 1;
      
      public static const const_1414:int = 2;
      
      public static const const_1648:int = 3;
      
      public static const const_1729:int = 4;
      
      public static const const_1649:int = 5;
      
      public static const const_1259:int = 10;
      
      public static const const_1783:int = 11;
      
      public static const const_1773:int = 12;
      
      public static const const_1702:int = 13;
      
      public static const const_1656:int = 16;
      
      public static const const_1586:int = 17;
      
      public static const const_1772:int = 18;
      
      public static const const_1749:int = 19;
      
      public static const const_1623:int = 20;
      
      public static const const_1806:int = 22;
      
      public static const const_1647:int = 23;
      
      public static const const_1665:int = 24;
      
      public static const const_1597:int = 25;
      
      public static const const_1599:int = 26;
      
      public static const const_1779:int = 27;
      
      public static const const_1728:int = 28;
      
      public static const const_1776:int = 29;
      
      public static const const_1707:int = 100;
      
      public static const const_1619:int = 101;
      
      public static const const_1750:int = 102;
      
      public static const const_1624:int = 103;
      
      public static const const_1657:int = 104;
      
      public static const const_1809:int = 105;
      
      public static const const_1744:int = 106;
      
      public static const const_1674:int = 107;
      
      public static const const_1784:int = 108;
      
      public static const const_1594:int = 109;
      
      public static const const_1603:int = 110;
      
      public static const const_1607:int = 111;
      
      public static const const_1720:int = 112;
      
      public static const const_1797:int = 113;
      
      public static const const_1676:int = 114;
      
      public static const const_1731:int = 115;
      
      public static const const_1632:int = 116;
      
      public static const const_1691:int = 117;
      
      public static const const_1650:int = 118;
      
      public static const const_1752:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1352:
            case const_1259:
               return "banned";
            case const_1414:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
