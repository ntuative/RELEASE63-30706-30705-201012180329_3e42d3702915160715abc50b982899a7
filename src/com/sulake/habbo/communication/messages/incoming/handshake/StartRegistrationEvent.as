package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.StartRegistrationParser;
   
   public class StartRegistrationEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function StartRegistrationEvent(param1:Function)
      {
         super(param1,StartRegistrationParser);
      }
   }
}
