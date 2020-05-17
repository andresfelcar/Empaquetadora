<?php
@session_start();
require_once "controller/Controller.php";

$resultado = $_SESSION['user'];
if ($resultado == null) {
    header("Location:index.php");
}

$invoice =  new Controller();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ranking</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link href="resource/css/style.css" rel="stylesheet">
</head>

<body>
    <div class="naveg">
        <h2 id="hh">Ranking</h2>
    </div>
    <div class="container">
        <div class="marggin">
            <?php include('menu.php'); ?>
        </div>
        <br>
        <form action="" method="POST">
            <input type="date" name="fecha1">
            <input type="date" name="fecha2">
            <button type="submit" class="btn btn-success">Buscar</button>
        </form>

        <table id="data-table" class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th width="7%">Id Vendedor</th>
                    <th width="30%">Nombre</th>
                    <th width="15%">Total</th>
                    <th width="3%"></th>
                    <th width="3%"></th>
                    <th width="3%"></th>
                </tr>
            </thead>
            <?php
            if (!empty($_POST['fecha1']) && !empty($_POST['fecha2'])) {
                $array=[];
                array_push($array,$_POST['fecha1'],$_POST['fecha2']);
                $result = $invoice->Ranking(0,$array);
                for ($i = 0; $i < count($result); $i++) {

                    $resultado = $result[$i];

                    echo "<tr>
                    <td>$resultado[0]</td>
                    <td>$resultado[2]</td>
                    <td>$resultado[1]</td>
                    </tr>";
                }
            }
            ?>

        </table>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="resource/js/invoice.js"></script>
</body>

</html>