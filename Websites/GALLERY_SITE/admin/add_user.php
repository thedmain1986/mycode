<?php include("includes/header.php"); ?>


<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php 

if(isset($_POST['create'])){
    
    $user = new User();
    
    if($user){
        
        echo $user->username = $_POST['username'];
        $user->first_name = $_POST['first_name'];
        $user->last_name = $_POST['last_name'];
        $user->password =$_POST['password'];
      
        $user->set_file($_FILES['user_image']);
        $user->save_user_and_image();
        
    }
    
    
}

//
//    $user = User::find_by_id($_GET['id']);
//
//    if(isset($_POST['update'])){
//
//        if($user){
//
//            $user->title = $_POST['title'];
//            $user->caption = $_POST['caption'];
//            $user->alternate_text = $_POST['alternate_text'];
//            $user->description = $_POST['description'];
//            
//            $user->save();
//            
//        }
//
//    }





?>


<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

    <!--  top navigation-->
    <!-- Brand and toggle get grouped for better mobile display -->
    <?php include("includes/top_nav.php"); ?>     


    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <?php include("includes/side_nav.php"); ?>

</nav>




<div id="page-wrapper">


    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
           
            <div class="col-lg-12">
                <h1 class="page-header">
                    User
                    <small>Subheading</small>
                </h1>

                <form action="" method="post" enctype="multipart/form-data">

                    <div class="col-md-6 col-md-offset-2">
                        
                        <input type="file" name="user_image">

                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name ="username" class="form-control" >

                        </div>
                        
                   <div class="form-group">
                            <label for="first_name">First_Name</label>
                            <input type="text" name ="first_name" class="form-control" >

                        </div>
                        
                        <div class="form-group">
                            <label for="last_name">Last_Name</label>
                            <input type="text" name ="last_name" class="form-control" >

                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name ="password" class="form-control" v>

                        </div>
                        
                         <div class="form-group">
                            
                            <input type="submit" name ="create" class="btn-lg btn-primary center-block  " >

                        </div>
                       



                    </div><!--End of Col 8-->

                 
                </form>



            </div>
            
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->


</div>
<!-- /#page-wrapper -->

<?php include("includes/footer.php"); ?>