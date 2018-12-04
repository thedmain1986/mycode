<?php
if(isset($_POST['submit'])) {
    //Email information
    $admin_email = "derrickjones@djsimaginarium.com";
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    //send email
    mail($admin_email, "$name", "$message", "From:" . $email);

    //Email response
    $msg= "Thank you for contacting us!";

    header("Location: ../FITNESS_SITE//index.php?msg=$msg");
}


else  {
    ?>
    $msg = "Failed To Send"
    header("Location: ../FITNESS_SITE//index.php?msg=$msg");
    <?php
}
?>