<?php
require_once "model/Conexion.php";

class ProductsList_Controller
{
    private function __construct()
    {
    }

    public static function Main($option, $array = [])
    {
        $product = new  ProductsList_Controller();
        switch ($option) {
            case 0:
                $result = $product->Consult($array);
                break;
            case 1:
                $result = $product->Insert();
                break;
        }
        return $result;
    }

    public function Consult($array)
    {
        $conexion = Conexion::connection();

        $sql = "SELECT * from usuarios WHERE Correo = ? AND Contrasena = MD5(?) ";

        $stmt = $conexion->prepare($sql);

        $stmt->bind_param("s", $array);

        $stmt->execute();
        //obtener todos los resultados
        $result = $stmt->get_result();
        //asosiarlos a un array fetch row
        return $result->fetch_row();
    }

    public function Insert()
    {
    }
}
