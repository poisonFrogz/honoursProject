<?php

if (isset($_POST['submit'])) {
 $username = $_POST['username'];
 $password = $_POST['password'];

 $serverName = "localhost";
 $serverUser = "root";
 $serverPass = "";
 $dbName = "honours";

 $conn = mysqli_connect($serverName,$serverUser,$serverPass,$dbName);

 if (!$conn) {
     die("Connection Failed: ".mysqli_connect_error());
    }

 if (empty($username) || empty($password)) {
     header("location: index.php?error=empty");
     exit();
 }
 else {
     // sql statement to check if the user exists
     $sql = "SELECT * FROM staff WHERE  username = ?";
     // prepares the statement
     $stmt = $conn->prepare($sql);
     //binds username and pwd to the user input
     $stmt->bind_param("s",$username);
     //executes the statement
     $stmt->execute();
     $stmt->store_result();
     $stmt->bind_result($id,$userName,$pwd);


     if($stmt ->num_rows < 1) {
         header("location: index.php?error=noUser");
         exit();
     }
     else if ($stmt->num_rows == 1) {
         $stmt->fetch();
         if (password_verify($password,$pwd)) {
             header("location: dashboard.php");
         }
         else {
             header("location: index.php?error=incorrectPass");
             exit();
         }
     }
 }

}

else {
    header("location: index.php?error=invalid");
    exit();
}
