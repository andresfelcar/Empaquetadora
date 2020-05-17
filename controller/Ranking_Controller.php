<?php
class Ranking_Controller
{
    private function __construct()
    {
    }

    public static function Main($option, $array = [])
    {
        $ranking = new Ranking_Controller();
        switch ($option) {
            case 0:
                $result = $ranking->Consult($array);
                break;
        }
        return $result;
    }

    public function Consult($array1)
    {
        $conexion = Conexion::connection();

        $sql = "SELECT IdUsuario from usuarios";

        $result=$conexion->query($sql);
        $resultado=[];
        while($resultado1=$result->fetch_row()){
            array_push($resultado,$resultado1[0]);
        }
       
        $array=[];
        
        for($i=0;$i<count($resultado);$i++){
            $sql = "SELECT fa.IdUsuario, SUM(fa.Total) as Total, us.Nombre1  FROM facturas  fa INNER JOIN usuarios us WHERE fa.IdUsuario='$resultado[$i]' AND us.IdUsuario='$resultado[$i]' AND fa.Fecha BETWEEN '$array1[0]' AND '$array1[1]'";
            $result1=$conexion->query($sql);
            $result1=$result1->fetch_row();
            $array[$i]=$result1;
        }
        return $array;
       
    }
}
