package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_831:BigInteger;
      
      private var var_1938:BigInteger;
      
      private var var_1442:BigInteger;
      
      private var var_1937:BigInteger;
      
      private var var_1191:BigInteger;
      
      private var var_1441:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1191 = param1;
         this.var_1441 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1191.toString() + ",generator: " + this.var_1441.toString() + ",secret: " + param1);
         this.var_831 = new BigInteger();
         this.var_831.fromRadix(param1,param2);
         this.var_1938 = this.var_1441.modPow(this.var_831,this.var_1191);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1442 = new BigInteger();
         this.var_1442.fromRadix(param1,param2);
         this.var_1937 = this.var_1442.modPow(this.var_831,this.var_1191);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_1938.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_1937.toRadix(param1);
      }
   }
}
