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

        $sql = "SELECT res.IdProducto, res.Nombre,SUM(res.cantidad) Cantidad from 
        (SELECT pr.Nombre,fa.IdFactura, fa.Fecha,de.IdDFactura,
        de.IdProducto,de.Cantidad from facturas fa
        INNER JOIN detallefacturas de
        INNER JOIN productos pr
        WHERE fa.Fecha = ? AND de.IdProducto = pr.IdProducto
        AND fa.IdFactura = de.IdFactura AND fa.Estado !=0) res
        GROUP by res.IdProducto";

        $stmt = $conexion->prepare($sql);

        $stmt->bind_param("s", $array);

        $stmt->execute();
        //obtener todos los resultados
        $result = $stmt->get_result();
        //asosiarlos a un array fetch row
        return $result;
    }

    public function Insert()
    {
    }
}
