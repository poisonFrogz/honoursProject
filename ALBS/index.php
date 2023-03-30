<?php
include 'header.php';
?>

<main>
    <h3 class = "pDetails">Personal Details</h3>
    <form action="bookingDetails.php" method="post">

        <label for="title">Title:</label>
        <select name = "title" class = "title">
            <option value = "Mr">Mr</option>
            <option value = "Miss">Miss</option>
            <option value = "Mrs">Mrs</option>
            <option value = "Ms">Ms</option>
            <option value = "Mx">Mx</option>
            <option value = "Dr">Dr</option>
            <option value = "Prof">Prof</option>
        </select>

        <label for = "forename">Forename:</label>
        <input type="text" name="forename">

        <label for = "surname">Surname:</label>
        <input type = "text" name = "surname">

        <label for="email">Email:</label>
        <input type = "text" name = "email">

        <input type="submit" class="pSubmit">

    </form>


</main>






</body>





</html>

