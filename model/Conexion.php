<?php
class Conexion{

    private function __construct(){}

    public static function connection(){
        return mysqli_connect("localhost", "u539108239_laimperial", "[~*MjfF6", "u539108239_laimperial");
    }  
}
    
?>