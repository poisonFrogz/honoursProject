<!DOCTYPE html>
<html lang="en">
<head>
    <!-- <link rel = "stylesheet" type="text/css" href="/style/ALSSstyle.css"> -->
    <meta charset="UTF-8">
    <title>Customer Check</title>
</head>
<body>
<div class="header">
    <img src = "/imgs/logo.png" alt = "Lounge Logo" class = "logo">
    <h1>Staff Portal</h1>
    <h1>Logged In As: root</h1>
</div>
<div class="nav">
    <ul>
        <li><a href="dashboard.php">Dashboard</a> </li>
        <li><a href="checkIn.php">Check In</a> </li>
        <li><a href="visitManagement.php">Visit Management</a></li>
    </ul>
</div>
<?php
include 'functions.php';
$ref = $_POST['reference'];

checkBooking($ref);

?>




</body>
</html>
