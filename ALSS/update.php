<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checked In!</title>
</head>
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
<body>
<?php
include 'functions.php';
$ref = $_COOKIE['id'];

updateBooking($ref);

?>
<a href="checkIn.php">
<button type="button">Home</button>
</a>





</body>
</html>
