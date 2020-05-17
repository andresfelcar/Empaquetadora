<?php
@session_start();
require_once "controller/Controller.php";

$resultado = $_SESSION['user'];
if ($resultado == null) {
    header("Location:index.php");
}
//validacion de el post definido
if (!empty($_POST['nombreZona'])) {

    $insert =  new Controller();

    $result = $insert->Zone(1, $_POST['nombreZona']);
}
$zonas =  new Controller();

if (!empty($_POST['code'])) {
    
    $deletecli =  new Controller();

    $result = $deletecli->Zone(3, $_POST['code']);
}
if (!empty($_POST['update_idd'])) {
    
     //creamos array
     $array = [];
     //agregamos datos al array  array_push(nombre_del_array,Variable1,varable2,variables...);
     array_push($array, $_POST['update_idd']);
 //objeto para acceder al sellers
 $product =  new Controller();
 
 $result = $product->Clients(4,$array);
 }



?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zonas</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />


    <link href="resource/css/style.css" rel="stylesheet">
    <link href="resource/css/clientes2.css" rel="stylesheet">

</head>

<body>
    <div class="naveg">
        <div class="heading">
            <h2 id="hh">Zonas</h2>
        </div>
    </div>

    <div class="regemple" id="regemple">
        <form class="form_reg" action="" method="POST">
            <h3>REGISTRAR  ZONA</h3>
            <p>Nombre: <input name="nombreZona" class="input" type="text" required autofocus></p>
            <button class="button1" type="submit"> Registrar </button>

        </form>
    </div>

    <div class="regemple2" id="regemple2">
        <form class="form_reg" action="" method="POST">
            <h3>ELIMINAR </h3>
            <p>Codigo: <input name="code" class="input" type="number" required autofocus></p>
            <button class="button1" type="submit"> Eliminar </button>

        </form>
    </div>


    <div class="tabla">
        <div class="inclu"><?php include('menu.php'); ?></div>
        <table id="table">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre de la zona</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php
                $result = $zonas->Zone(0);
                while ($mostrar = $result->fetch_row()) {
                ?>

                    <tr>

                        <td><?php echo $mostrar[0] ?></td>
                        <td><?php echo $mostrar[1] ?></td>
                        <td><a href="Edit_Zone.php?update_id=<?php echo $mostrar[0] ?>" title="Editar Zona" >
                                <div class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span></div>
                            </a></td>
                            <td><a href="View_zonas.php?update_idd=<?php echo $mostrar[0] ?>" title="Ver zona" >
                                <div class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></div>
                            </a></td>

                    </tr>
                <?php
                }
                ?>

            </tbody>
        </table>
    </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="resource/js/invoice.js"></script>
    <script src="resource/js/zonas.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>


</body>

</html>