import Debug "mo:base/Debug";
import Time  "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

    //stable es usado para matener el valor de las variables corregidas y el valor se mantiene despues del usa de la sentencia deploy
    stable var currentValue: Float = 300;
    //Mediante el uso de la siguiente metodo se puede cambiar el valor de una variable
    // currentValue := 300; 
    // la preposicion de let permite crear constantes por lo cual no permite cambiar su valor  
    let id = 12345678;
    // id := 343547654;


    // Debug.print("hello");
    // // el uso de debug_show permite imprimir los valores numericos 
    // Debug.print(debug_show(currentValue));
    // Debug.print(debug_show(id));

    // Funcion implementada para conocer el numero de segundos desde 1970
    stable var startTime = Time.now();
    // startTime := Time.now();
    Debug.print(debug_show(startTime));

    public func topUp( amount: Float){
        currentValue += amount ;

        Debug.print(debug_show(currentValue));

    };

    public func reduceDow (amount: Float){
        let tempValue: Float = currentValue - amount;
        if (tempValue >= 0) {
        currentValue -= amount;
        Debug.print(debug_show(currentValue));
        }else {
            Debug.print(debug_show("Sorry a problem was generated: The amount of money you reduce exced your limit. "))
        }
    };

    public query func checkBalance (): async Float {

        return currentValue;

    };

    public func compound () {
        let currenTime = Time.now ();
        let timeElapsedNS = currenTime - startTime ;
        let timeElapsedS = timeElapsedNS /1000000000;

        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));

        startTime := currenTime;

    }


    // topUp();





}