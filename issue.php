<?php
 session_start();
 include("DatabaseCon.php");
 $db=new DatabaseCon();
$oid=$_GET['oid'];
$ocid=$_GET['ocid'];
$nod=$_GET['nod'];
$idate=Date('Y-m-d');

echo $rdate=Date('Y-m-d', strtotime($idate. ' + '.$nod.' days'));



echo $s="update tbl_orderc set status='issued',idate='$idate',rdate='$rdate' where ocid=$ocid";
$db->insertQuery($s);

$s="select count(*) as cnt from tbl_orderc where oid=$oid and status='issued'";
$rs=$db->selectData($s);
$row=mysqli_fetch_array($rs);
$icnt=$row['cnt'];

$s="select count(*) as cnt from tbl_orderc where oid=$oid";
$rs=$db->selectData($s);
$row=mysqli_fetch_array($rs);
$ocnt=$row['cnt'];

if($ocnt==$icnt)
{
$s="update tbl_orderm set ostatus='Issued' where oid=$oid";
$db->insertQuery($s);
}

				  $ut=$_SESSION['utype'];
				  if($ut=="staff"){
echo "<script>alert('Issued');window.location='vorders1.php';</script>";
				  }
				  else  if($ut=="admin"){
echo "<script>alert('Issued');window.location='vorders.php';</script>";
				  }
?>