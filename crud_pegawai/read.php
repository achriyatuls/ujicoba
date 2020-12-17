<?php 	
include 'database.php';

	$query = $link->query("SELECT * FROM movies");	
	$result = array();	
	
	
	//while ($rowData = $query->fetch_assoc()) {
		//$result[] = $rowData;
	//} 
	while ($rowData = $query->fetch_assoc()) 
		{
		
		//$result[] = array(		
		//);
		$result[]=$rowData;
		//echo $rowData[2];
	}
	
	$data=array(
	'status'=>'success',
	'data'=>$result,
	);
//kesalahan awal karena penulisan res api yang salah 
//penulisan yang benar seperti yang sudah diperbaiki 
//yg kurang tepat seperti pada notes

	echo json_encode($data);
	
	//echo "<br>";
	
	
	
	?>
	










































