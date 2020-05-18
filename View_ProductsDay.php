<?php
@session_start();
require_once "controller/Controller.php";

$resultado = $_SESSION['user'];
if ($resultado == null) {
    header("Location:index.php");
}
if ($resultado[9] == 2) {
    header("location:View_Invoice.php");
}
$invoice =  new Controller();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos del día</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link href="resource/css/style.css" rel="stylesheet">
</head>

<body>
    <div class="naveg">
        <h2 id="hh">Productos del día</h2>
    </div>
    <div class="container">
        <div class="marggin">
            <?php include('menu.php'); ?>
        </div>
        <br>
        <form action="" method="POST">
            <input type="date" name="dia">
            <button type="submit" class="btn btn-success">Buscar</button>
        </form>
        <table id="data-table" class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th width="10%">Id Producto</th>
                    <th width="30%">Nombre</th>
                    <th width="30%">Cantidad</th>
                 
                </tr>
            </thead>
            <?php
            if (!empty($_POST['dia'])) {
                $result = $invoice->ProductsList(0,$_POST['dia']);
                while($resultado = $result->fetch_array()) {
                    echo "<tr>
                    <td>$resultado[0]</td>
                    <td>$resultado[1]</td>
                    <td>$resultado[2]</td>
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