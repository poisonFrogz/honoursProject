<?php
$username = $_POST['username'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

$serverName = "localhost";
$serverUser = "root";
$serverPass = "";
$dbName = "honours";

$conn = mysqli_connect($serverName,$serverUser,$serverPass,$dbName);

if (!$conn) {
    die("Connection Failed: ".mysqli_connect_error());
}

else {
    $sql = "INSERT INTO staff (username,pwd) values (?,?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss",$username,$password);
    $stmt->execute();


}
