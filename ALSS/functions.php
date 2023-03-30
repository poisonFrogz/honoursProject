<?php

function guestsToday() {
    $date = date("Y/m/d");


    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname );

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else {
        $sql = "SELECT COUNT(bookingDate) FROM booking WHERE bookingDate = ?";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s",$date);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($guests);
        $stmt->fetch();

        echo $guests . " Total";

        mysqli_close($conn);

    }

}

function checkedIn() {
    $date = date("Y/m/d");


    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname );

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else {
        $sql = "SELECT COUNT(bookingDate) FROM booking WHERE bookingDate = ? AND checkedIn = 'Yes'";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s",$date);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($checkedIn);
        $stmt->fetch();

        echo $checkedIn . " Checked In";

        mysqli_close($conn);

    }

}

function checkBooking($bookingID) {
    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname );

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else {

        $sql = ("SELECT bookingID, booking.customerID, surname, flightNumber, bookingDate, bookingTime,
             SUM(adults + children + infants)
                 FROM booking
                 INNER JOIN customer ON customer.customerID = booking.customerID
                 WHERE bookingID = ?");

        $stmt = $conn -> prepare($sql);
        $stmt -> bind_param("s", $bookingID );
        $stmt -> execute();
        $stmt -> bind_result($id, $CID,$surname,$flightNumber,$bookingDate,$bookingTime,$noOfPax);
        $stmt -> fetch();

        if ($id == NULL) {
            header("location: checkIn.php?error=noBooking");
        }
        else {
            setcookie("id",$id);
            echo "<h3> Reference Number: $id </h3>
                  <h3>Name: $surname</h3>
                  <h3>Flight No: $flightNumber</h3>
                  <h3>Time: $bookingTime</h3>
                  <h3>Number of Pax: $noOfPax</h3>
                  <form action='update.php' method='post'><input type='submit'></form>";

        }


    }
}

function updateBooking($bookingID) {
    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname );

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else {
        $sql = "UPDATE booking
                SET checkedIn = 'Yes'
                WHERE bookingID = ?";

        $stmt = $conn -> prepare($sql);
        $stmt -> bind_param("s", $bookingID );
        $stmt -> execute();

        echo $bookingID." has been checked in ";

    }
}

function displayBookings ($fromDate, $toDate, $fromTime, $toTime) {
    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "honours";

    //connect to honours DB
    $conn = new mysqli($servername,$username,$password,$dbname );

    //stops connection if it fails
    if($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else {
        $sql = "SELECT bookingID, booking.customerID, surname, bookingDate, bookingTime, adults, children, infants, checkedIn
            FROM booking
            INNER JOIN customer ON customer.customerID = booking.customerID
            WHERE bookingDate BETWEEN ? AND ? AND bookingTime BETWEEN ? and ?
            ORDER BY bookingDate ASC,bookingTime ASC";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssss", $fromDate, $toDate,$fromTime,$toTime);
        $stmt->execute();
        $result = $stmt->get_result();

        while ($row = $result->fetch_assoc()){
            echo $row['bookingID']. "&nbsp&nbsp".
                 $row['surname']. "&nbsp&nbsp".
                 $row['bookingDate']."&nbsp&nbsp".
                 $row['bookingTime']. "&nbsp&nbsp".
                 $row['checkedIn'].  "<br>";
        }



    }
}


