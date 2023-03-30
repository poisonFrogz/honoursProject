<?php
include 'header.php';
?>
<main>

    <h3>Booking Details</h3>
    <form action="submit.php" method="post">
        <label for = "bookingDate">Date:</label>
        <input type="date" name = "bookingDate">

        <label for = "bookingTime">Time:</label>
        <input type = "time" name = "bookingTime">

        <label for = "flightNumber">Flight Number:</label>
        <input type = "text" name = "flightNumber">

        <label for = "adults">Adults</label>
        <select name = "adults">
            <option value = 1> 1 </option>
            <option value = 2> 2 </option>
            <option value = 3> 3 </option>
            <option value = 4> 4 </option>
            <option value = 5> 5 </option>
            <option value = 6> 6 </option>
        </select>

        <label for = "children">Children:</label>
        <select name = "children">
            <option value = 0> 0 </option>
            <option value = 1> 1 </option>
            <option value = 2> 2 </option>
            <option value = 3> 3 </option>
            <option value = 4> 4 </option>
            <option value = 5> 5 </option>
            <option value = 6> 6 </option>
        </select>

        <label for = "infants">Infants:</label>
        <select name = "infants">
            <option value = 0> 0 </option>
            <option value = 1> 1 </option>
            <option value = 2> 2 </option>
            <option value = 3> 3 </option>
            <option value = 4> 4 </option>
            <option value = 5> 5 </option>
            <option value = 6> 6 </option>
        </select>

        <input type="submit" class = "bSubmit">
    </form>
  <?php
    //personal details

    $title = $_POST['title'];
    $forename = $_POST['forename'];
    $surname = $_POST['surname'];
    $email = $_POST['email'];

    //DB required variables
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname);

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else if (empty($title) || empty($forename) || empty($surname) || empty($email)) {
        header("location:index.php?error=empty");
    }
    //connection works, continue with query
    else {
        //SQL statement to add form data to the customer table
        $personalDetails = "INSERT INTO customer (title,forename,surname,email) values (?,?,?,?)";

        //Add to customer table
        $stmt = $conn -> prepare($personalDetails);
        $stmt ->bind_param("ssss", $title, $forename, $surname, $email );
        $stmt -> execute();

        //Gets the last customerID from the customer table
        $lastID = $conn->insert_id;

        //sets a cookie with the customer ID to use on the next page
        setcookie("id",$lastID);
        echo "Data entered successfully " .$lastID;

        //close connection

        mysqli_close($conn);

    }

    ?>


</main>
</body>

</html>
