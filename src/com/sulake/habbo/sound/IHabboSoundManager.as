package com.sulake.habbo.sound
{
   import com.sulake.core.runtime.IUnknown;
   
   public interface IHabboSoundManager extends IUnknown
   {
       
      
      function set volume(param1:Number) : void;
      
      function set previewVolume(param1:Number) : void;
      
      function get volume() : Number;
      
      function playSound(param1:String) : void;
      
      function loadSoundUrl(param1:String) : IHabboSound;
      
      function loadTraxSong(param1:int, param2:String) : IHabboSound;
   }
}
