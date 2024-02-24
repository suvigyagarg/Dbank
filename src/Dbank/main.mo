//import debug class for print functionality
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";



//creating a cannister actors--> class
actor Dbank {
  //create a variable
  
  // stable keyword upgrade the variable to orthogonally persistent variable 
  stable var currentvalue : Float= 300;
   // currentvalue := 300 ;
 

  stable var startTime =Time.now();
   // startTime :=Time.now();
  Debug.print(debug_show(startTime));

  //let is constant cannot be changed

  let id = 1335465756786;

  Debug.print(debug_show (currentvalue));
  Debug.print(debug_show (id));

  //call this function in terminal a public function   dfx canister call  Dbank topUp
  public func topUp(amount : Float) {

    currentvalue += amount;
    Debug.print(debug_show (currentvalue));

  };

  public func withdraw(amount : Float) {
 // need to specify the type for a operation like following
    let temp : Float = currentvalue - amount;

    if (temp >= 0) {
      currentvalue -= amount;
      Debug.print(debug_show (currentvalue));
    }

    else {
      Debug.print("Bank Balance outreached amount >currentvalue ");
    };

  };

// query function work faster than update function and to return a sync type 
// and return type 
//query gunction faster as update call require concesus in the blockchain

  public query func checkBalance(): async Float {

   return currentvalue ;  
  };


public func compound(){
   let currentTime = Time.now();
   let elapsedNS = currentTime -startTime;
   let elapsedS = elapsedNS/1000000000 ;

   // to update a value held in motoko we use  := operator
   currentvalue := currentvalue * (1.01 ** Float.fromInt(elapsedS));
   startTime :=currentTime;
};


};
