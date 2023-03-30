<?php
include 'header.php';
?>
<main>
    <?php

    //booking details

    $bookingDate = $_POST['bookingDate'];
    $bookingTime = $_POST['bookingTime'];
    $flightNumber = $_POST['flightNumber'];
    $adults = $_POST['adults'];
    $children = $_POST['children'];
    $infants = $_POST['infants'];

    //DB required variables
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname );

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

//connection works, continue with query
    else {

        //Customer ID from customer table to use in booking row creation
        $customerID = $_COOKIE['id'];

        //SQL statement to add form data and PK of customer table to the booking table
        $bookingInfo = "INSERT INTO booking (customerID,flightNumber,bookingDate,bookingTime,adults,children,infants) values (?,?,?,?,?,?,?)";
        $bookingID = "SELECT bookingID FROM booking WHERE customerID = ?";
        //Add to booking table
        $stmt = $conn -> prepare($bookingInfo);
        $stmt ->bind_param("isssiii", $customerID, $flightNumber, $bookingDate, $bookingTime, $adults, $children, $infants);
        $stmt -> execute();

        $stmt = $conn -> prepare($bookingID);
        $stmt -> bind_param("i", $customerID);
        $stmt ->execute();
        $stmt -> bind_result($BID);
        $stmt -> fetch();

        echo "Booking Successful! your Unique Reference Number is: " . $BID;



        //close connection
        mysqli_close($conn);



    }

    ?>
</main>






</html>


