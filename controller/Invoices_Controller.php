<?php
require_once "model/Conexion.php";

class Invoices_Controller
{
    private function __construct()
    {
    }

    public static function Main($option, $array = [])
    {
        $invoice = new Invoices_Controller();
        switch ($option) {
            case 0:
                $result = $invoice->Consult($array);
                break;
            case 1:
                $result = $invoice->Insert($array);
                break;
            case 2:
                $result = $invoice->Update($array);
                break;
            case 3:
                $result = $invoice->Delete($array);
                break;
            case 4:
                $result = $invoice->DeleteDetFac($array);
                break;
            case 5:
                $result = $invoice->InsertDetFac($array);
                break;
        }
        return $result;
    }

    public function Consult($array)
    {
        if ($array[0] == 1) {
            $conexion = Conexion::connection();
            $sql = "Select fa.IdFactura,fa.Fecha,cl.Nombre1, fa.Total from facturas fa INNER JOIN clientes cl INNER JOIN usuarios us where fa.IdCliente = cl.IdCliente and fa.IdUsuario= us.IdUsuario ";
            return $conexion->query($sql);
        }
        if ($array[0] == 2) {
            $conexion = Conexion::connection();
            $sql = "Select fa.IdFactura,fa.Fecha,cl.Nombre1, fa.Total from facturas fa INNER JOIN clientes cl INNER JOIN usuarios us where fa.IdCliente = cl.IdCliente and fa.IdUsuario= us.IdUsuario AND fa.IdUsuario='$array[1]' ";
            return $conexion->query($sql);
        }
        $conexion = Conexion::connection();
        $id = $array;

        $result1 = $conexion->query("Select fa.IdFactura,fa.Fecha,fa.Total,cl.Nombre1,cl.Direccion  from facturas fa INNER JOIN clientes cl where fa.IdCliente=cl.IdCliente AND fa.IdFactura='$id'");
        $result2 = $conexion->query("Select pr.IdProducto, pr.Nombre,de.Cantidad, pr.Precio, de.IdDFactura  from detallefacturas de INNER JOIN productos pr where de.IdProducto=pr.IdProducto and de.IdFactura='$id'");

        $array = [];
        array_push($array, $result1, $result2);
        return  $array;
    }

    public function Insert($array)
    {
        $conexion = Conexion::connection();
        date_default_timezone_set('America/Bogota');
        $date = date('Y-m-d h:i:s', time());
        $stmt = $conexion->prepare("INSERT INTO facturas(IdCliente,Fecha,IdUsuario,Total,Estado) VALUES(?,'$date',?,?,true)");
        $stmt->bind_param("iid", $array['companyName'], $array['userId'], $array['subTotal']);
        $stmt->execute();
        $id = $conexion->query("SELECT @@identity AS IdFactura");
        $id = $id->fetch_row();

        for ($i = 0; $i < count($array['productCode']); $i++) {
            $stmt = $conexion->prepare("INSERT INTO detallefacturas(IdFactura,IdProducto,Cantidad) VALUES (?,?,?)");
            $stmt->bind_param("iii", $id[0], $array['productCode'][$i], $array['quantity'][$i]);
            $stmt->execute();
            $var = $array['productCode'][$i];
            $sql = "Select Cantidad From productos Where IdProducto='$var'";
            $resultado = $conexion->query($sql);
            $resultado = $resultado->fetch_row();
            $total = $resultado[0] - $array['quantity'][$i];
            $stmt = $conexion->prepare("UPDATE productos SET Cantidad=? WHERE IdProducto= ?");
            $stmt->bind_param("ii", $total, $array['productCode'][$i]);
            $stmt->execute();
        }
        return $stmt;
    }

    public function Update($array)
    {
        $conexion = Conexion::connection();
        $stmt = $conexion->prepare("UPDATE facturas SET IdCliente = ?, Total= ? WHERE IdFactura=?");
        $stmt->bind_param("idi", $array['companyName'], $array['subTotal'], $array['invoiceId']);
        $stmt->execute();



        for ($i = 0; $i < count($array['detFactura']); $i++) {
            $stmt = $conexion->prepare("UPDATE detallefacturas SET IdProducto=?, Cantidad=? WHERE IdDFactura=?");
            $stmt->bind_param("iii", $array['productCode'][$i], $array['quantity'][$i], $array['detFactura'][$i]);
            $stmt->execute();
        }
        return $stmt;
    }

    public function Delete($array, $count = 0)
    {
        $conexion = Conexion::connection();
        $sql = "DELETE from detallefacturas WHERE IdFactura = ? ";
        if ($count == 1) {
            $sql = "DELETE from facturas WHERE IdFactura = ? ";
        }
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("i", $array[0]);
        $stmt->execute();

        if ($count == 0) {
            ++$count;
            $object = new Invoices_Controller();
            $object->Delete($array, $count);
        }
        return $stmt;
    }
    public function DeleteDetFac($array)
    {
        $conexion = Conexion::connection();
        $sql = "Select IdFactura,Cantidad,IdProducto from detallefacturas WHERE IdDFactura = '$array' ";
        $resultado = $conexion->query($sql);
        $resultado = $resultado->fetch_row();

        $sql = "Select Precio from productos WHERE IdProducto = '$resultado[2]' ";
        $resultado2 = $conexion->query($sql);
        $resultado2 = $resultado2->fetch_row();
        $valor = $resultado2[0] * $resultado[1];

        $sql = "Select Total From facturas Where IdFactura='$resultado[0]'";
        $resultado2 = $conexion->query($sql);
        $resultado2 = $resultado2->fetch_row();

        $total = $resultado2[0] - $valor;
        $sql = "UPDATE facturas SET Total ='$total' WHERE IdFactura='$resultado[0]'";
        $conexion->query($sql);

        $sql = "DELETE from detallefacturas WHERE IdDFactura = ? ";

        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("i", $array);
        $stmt->execute();

        return $stmt;
    }
    public function InsertDetFac($array)
    {
        $conexion = Conexion::connection();
        
        $stmt = $conexion->prepare("INSERT INTO detallefacturas(IdFactura,IdProducto,Cantidad) VALUES (?,?,?)");
        $stmt->bind_param("iii", $array[0], $array[1], $array[2]);
        $stmt->execute();

        $sql = "Select Total From facturas Where IdFactura='$array[0]'";
        $resultado = $conexion->query($sql);
        $resultado = $resultado->fetch_row();

        $total= $resultado[0]+$array[3];
        $sql="UPDATE facturas SET Total ='$total' WHERE IdFactura='$array[0]'";
        $conexion->query($sql);

        $sql = "Select Cantidad From productos Where IdProducto='$array[1]'";
        $resultado = $conexion->query($sql);
        $resultado = $resultado->fetch_row();

        $total = $resultado[0] - $array[2];
        $stmt = $conexion->prepare("UPDATE productos SET Cantidad=? WHERE IdProducto= ?");
        $stmt->bind_param("ii", $total, $array[1]);
        $stmt->execute();
    }
}
