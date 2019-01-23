
<?php

if(isset($_GET['p_id'])){

    $the_post_id = escape($_GET['p_id']);


}


$query = "SELECT * FROM posts WHERE post_id= $the_post_id";
$select_posts_by_id = mysqli_query($connection, $query);


while($row = mysqli_fetch_assoc($select_posts_by_id)){

    $post_id=  escape($row['post_id']);        
    $post_user =  escape($row['post_user']);  
    $post_title =  escape($row['post_title']); 
    $post_category_id =  escape($row['post_category_id']); 
    $post_status =  escape($row['post_status']); 
    $post_image =  escape($row['post_image']); 
    $post_content =  escape($row['post_content']);
    $post_tags =  escape($row['post_tags']); 
    $post_comment_count =  escape($row['post_comment_count']); 
    $post_date =  escape($row['post_date']); 

}

if(isset($_POST['update_post'])){

    $post_user = escape($_POST['post_user']);
    $post_title = escape($_POST['post_title']);
    $post_category_id = escape($_POST['post_category']);
    $post_status = escape($_POST['post_status']);
    $post_image = escape($_FILES['images']['name']);
    $post_image_temp = escape($_FILES['images']['tmp_name']);
    $post_content = escape($_POST['post_content']);
    $post_tags = escape($_POST['post_tags']); 

    move_uploaded_file($post_image_temp, "../images/$post_image");

    if(empty($post_image)){


        $query = "SELECT * FROM posts WHERE post_id = $the_post_id ";

        $select_image = mysqli_query($connection,$query);

        while($row = mysqli_fetch_array($select_image)){ 
            
            $post_image = escape($row['post_image']);            

        }

    }



    $query = "UPDATE posts SET ";
    $query .="post_title = '{$post_title}', ";
    $query .="post_category_id = '{$post_category_id}', ";
    $query .="post_date = now(), ";
    $query .="post_user = '{$post_user}', ";
    $query .="post_status = '{$post_status}', ";
    $query .="post_tags = '{$post_tags}', ";
    $query .="post_content = '{$post_content}', ";
    $query .="post_image = '{$post_image}' ";
    $query .="WHERE post_id = {$the_post_id} ";

    $update_post = mysqli_query($connection,$query);

    confirm($update_post);

    echo "<p class='bg-success'>Post Updated. <a href ='../post.php?p_id={$the_post_id}'>View Post</a> or <a href ='post.php'>Edit More Posts</a></p>";


}





?>



<form action="" method="post" enctype="multipart/form-data">

    <div class ="form-group">
        <label for ="title">Post Title</label>
        <input value="<?php echo $post_title; ?>" type="text" class="form-control" name="post_title">
    </div>

    <div class ="form-group">
        <label for="users">Categories</label>
        <label for ="post_category"></label>
        <select name="post_category" id="">
            <?php

            $query = "SELECT * FROM categories ";
            $select_categories = mysqli_query($connection, $query);

            confirm($select_categories);

            while($row = mysqli_fetch_assoc($select_categories)){

                $cat_id =  $row['cat_id'];        
                $cat_title =  $row['cat_title']; 

               

                if($cat_id == $post_category_id){
                    
                    echo "<option selected value='$cat_id'>{$cat_title}</option>";
                    
                }else{
                    
                    echo "<option value='$cat_id'>{$cat_title}</option>";
                    
                }
                
                
            }


            ?>


        </select>

    </div>

   

            

   
    <div class ="form-group">
        <label for="users">Users</label>
        <label for ="users"></label>
        <select name="post_user" id="">
           
           <?php echo "<option value='{$post_user}'>{$post_user}</option>"; ?>
            <?php

            $users_query = "SELECT * FROM users ";
            $select_users = mysqli_query($connection, $users_query);

            confirm($select_users);

            while($row = mysqli_fetch_assoc($select_users)){

                $user_id =  $row['user_id'];        
                $username =  $row['username']; 

                echo "<option value='{$username}'>{$username}</option>";

            }


            ?>         


        </select>

    </div>





    <!--
<div class ="form-group">
<label for ="title">Post Author</label>
<input value="<?php echo $post_user; ?>" type="text" class="form-control" name="post_user">
</div>
-->

    <div class ="form-group">
        <select name="post_status" id="">

            <option value='<?php echo $post_status; ?>'> <?php echo $post_status; ?>

                <?php

                if($post_status == 'published'){


                    echo "<option value='draft'>Draft</option>"   ;

                }else{

                    echo "<option value='published'>Published</option>" ;
                }


                ?>



            </option>


        </select>
    </div>



    <div class ="form-group">
        <img width="100" src="../images/<?php echo $post_image; ?>" alt="">
        <input type="file" name="images">
    </div>

    <div class ="form-group">
        <label for ="post_tages">Post Tags</label>
        <input value="<?php echo $post_tags; ?>" type="text" class="form-control" name="post_tags">
    </div>

    <div class ="form-group">
        <label for ="post_content">Post Content</label>
        <textarea   class="form-control" name="post_content" id="body" cols="30" rows="10"><?php echo str_replace('\r\n','</br>',$post_content); ?>

        </textarea>
    </div>

    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="update_post" value="Update Post">
    </div>


</form>