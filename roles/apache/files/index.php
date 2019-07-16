
<h2> Apache HTTP  with PHP and MySQL </h2> 
<br />

<?php

$link = mysqli_connect("localhost", "admin", "admin", "test_db");

$str = "";

if ( !$link) {
	 $str = "Error: Unable to connect to mysql" . PHP_EOL . 
		"Errorno: " . mysqli_connect_error() . PHP_EOL;
	echo nl2br($str);
	exit;
}

$str = "MySQL Connection: Success"  . PHP_EOL . 
	"Host: " . mysqli_get_host_info($link) . PHP_EOL;

echo nl2br($str);

mysqli_close($link);

?>


