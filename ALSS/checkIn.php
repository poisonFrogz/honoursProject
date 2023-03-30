<html>
<head>
    <!-- <link rel = "stylesheet" type="text/css" href="/style/ALSSstyle.css"> -->
    <title>Dashboard</title>
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

<div class = "customer">
    <form action = "customerCheck.php" method ="post">
        <label for ="reference">Reference Number: </label>
        <input type ="text" name = "reference">
        <input type="submit" class="refSubmit">

    </form>
</div>

</body>

</html>
