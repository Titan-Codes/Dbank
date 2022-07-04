import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Dbank {
  stable var currentValue: Float = 100;
  // currentValue := 100;

  let id = 123456;
  // Debug.print(debug_show(id));
  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempVal: Float = currentValue - amount;
    if (tempVal >=0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("You can't withdraw more than the amount you have.");
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  // public func compound(){
  //   let currentTime = Time.now();
  //   let timeElapsedNS = currentTime - startTime;
  //   let timeElapsed = timeElapsedNS/1000000000;

  //   currentValue := (currentValue) * (1.01 ** Float.fromInt(timeElapsed));
  // }
}