
<?php  include "includes/header.php"; ?>



<?php


require './vendor/autoload.php';
require './classes/Config.php';






if(!isset($_GET['forgot'])){

    redirect('index.php');

}

if(ifItIsMethod('post')){

    if(isset($_POST['email'])){

        $email = $_POST['email'];
        //            $email = mysqli_real_escape_string($connection, trim($_POST['email']));

        $length = 50;

        $token = bin2hex(openssl_random_pseudo_bytes($length));

        if(email_exists($email)){

            if($stmt = mysqli_prepare($connection, "UPDATE users SET token='{$token}' WHERE user_email= ?")){

                mysqli_stmt_bind_param($stmt, "s", $email);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_close($stmt);     

                /**
                *
                *configure PHPMAILER
                *
                */
                $mail = new PHPMailer\PHPMailer\PHPMailer();   


                $mail->isSMTP();                                        // Set mailer to use SMTP
                $mail->Host = Config::SMTP_HOST;                        // Specify main and backup SMTP servers
                $mail->Username = Config::SMTP_USER;                    // SMTP username
                $mail->Password = Config::SMTP_PASSWORD;                // SMTP password
                $mail->Port = Config::SMTP_PORT;                        // TCP port to connect to
                $mail->SMTPSecure = 'tls';                              // Enable TLS encryption, `ssl` also accepted
                $mail->SMTPAuth = true;                                 // Enable SMTP authentication
                $mail->isHTML(true);                                    // Set email format to HTML
                $mail->CharSet = 'UTF-8';

                $mail->setFrom('derrickjones@djsimaginarium.com', 'Derrick Jones');
                $mail->addAddress($email);                              // Add a recipient

                //Content
                $mail->Subject = 'This is a test email SUBJECT line';
                $mail->Body    = '<p>Please click to reset your password </br>
                
                
                <a href="https://localhost/cms/reset.php?email='.$email.'&token='.$token.' ">https://localhost/cms/reset.php?email='.$email.'&token='.$token.'</a>
                
                
                
                
                </p>';
                
                
                
                $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

                if($mail->send()){
                    
                     $emailSent = true;
                    
                }else{
                    
                    $emailSent = false;
                }


        }else{

            echo "WRONG";

        }

    }
}
}



?>



<!-- Page Content -->
<div class="container">

    <div class="form-gap"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">

                        <?php if(!isset($emailSent)): ?>
                           
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Forgot Password?</h2>
                            <p>You can reset your password here.</p>
                            <div class="panel-body">




                                <form id="register-form" role="form" autocomplete="off" class="form" method="post">

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="email" name="email" placeholder="email address" class="form-control"  type="email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                    </div>

                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>

                            </div><!-- Body-->

                            <?php else: ?>
                            
                             <h2>Please check your email for reset link</h2>
                            
                             
                           <?php endif; ?>
                         




                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <hr>

    <?php include "includes/footer.php";?>

</div> <!-- /.container -->

