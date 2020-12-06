<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>InstruRental</title>
      <link rel="stylesheet" href="css/components.css">
      <link rel="stylesheet" href="css/responsee.css">
      <link rel="stylesheet" href="owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="owl-carousel/owl.theme.css">
      <!-- CUSTOM STYLE -->  
      <link rel="stylesheet" href="css/template-style.css">
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
      <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="js/jquery-ui.min.js"></script>    
      <script type="text/javascript" src="js/modernizr.js"></script>
      <script type="text/javascript" src="js/responsee.js"></script>   
      <!--[if lt IE 9]>
	      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
      <![endif]-->
   </head>
   <body class="size-1140">
      <!-- TOP NAV WITH LOGO -->  
     
      <?php include('includes/header.php');?>

       <section>
         <div id="head">
            <div class="line">
               <h1>Payment</h1>
            </div>
         </div>
		 
         <div id="content" >
            <div class="line">
               <div class="margin">
                  <div class="s-12 l-8 center ">
  
   
     <form action="rpayaction.php" class="customform" >

     <?php
          include("DatabaseCon.php");
            $db=new DatabaseCon();
  
		  //session_start();
		 // $sid=$_SESSION['uid'];
		  $oid=$_GET['oid'];
          $s="SELECT tbl_orderm.oid,tbl_pay.trent,tbl_pay.adv,tbl_pay.bal,tbl_pay.dam from tbl_orderm inner join tbl_pay on tbl_pay.oid=tbl_orderm.oid where tbl_orderm.oid='$oid'";
          $rs=$db->selectData($s);
          $row=mysqli_fetch_array($rs);
         
          
     ?>    


    <table>
     <input type="hidden" name="oid" value="<?php echo $row['oid'];?>" readonly />
      <tr><th>Card Number</th><td><input type="text"
                                              name="cno" 
                                            required maxlength="12" ></td></tr>

      <tr><th>CVV</th><td><input type="text" 
                                              name="cvv"
                                              required maxlength="3" ></td></tr>
      <tr><th>Total Amount</th><td><input type="text"
                                              name="tamt" 
                                              value="<?php echo $row['trent'];?>" required readonly></td></tr>

		<tr><th>Advance Paid</th><td><input type="text"
                                              name="tadv" 
                                              value="<?php echo $row['adv'];?>" required readonly></td></tr>
      <?php if($row['dam']!=NULL){ ?>
         <tr><th>Damage Cost(20%)</th><td><input type="text"
                                              name="dam"  value="<?php echo $row['dam'];?>"
                                            required  ></td></tr>       
											   <tr><th>Balance Amount to Pay</th><td><input type="text"
                                              name="bal"  value="<?php echo $row['bal']+ $row['dam'];?>"
                                            required  ></td></tr>
      <?php }  else {?>     
         <tr><th>Balance Amount to Pay</th><td><input type="text"
                                              name="bal"  value="<?php echo $row['bal'];?>"
                                            required  ></td></tr>       
      <?php }?>
   
      <tr><th></th><td><input type="submit" value="Pay Balance"></td></tr>  
   </table>


</form>
 <br/>
 
</div>
                  
               </div>
            </div>
         </div>
         <!-- MAP -->	
        
         
      </section>
      <!-- FOOTER -->   
      <footer>
         <div class="line">
            <div class="s-12 l-6">
               <p>Copyright 2020, InstruRental
               </p>
            </div>
            <div class="s-12 l-6">
               <p class="right">
                  <a class="right" href="#" title="Responsee - lightweight responsive framework">All Rights Reserved.</a>
               </p>
            </div>
         </div>
      </footer>
      <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>   
      <script type="text/javascript">
         jQuery(document).ready(function($) {  
           $("#owl-demo").owlCarousel({
         	slideSpeed : 300,
         	autoPlay : true,
         	navigation : false,
         	pagination : false,
         	singleItem:true
           });
           $("#owl-demo2").owlCarousel({
         	slideSpeed : 300,
         	autoPlay : true,
         	navigation : false,
         	pagination : true,
         	singleItem:true
           });
         });	
          
      </script> 
   </body>
</html>





