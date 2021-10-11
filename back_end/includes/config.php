<?php 

	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "mydb";
	$conn;


	try {
		$conn = new PDO("mysql:host=".$servername.";dbname=".$dbname."", $username, $password, array('charset'=>'utf8'));
	  			// set the PDO error mode to exception
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$conn->query("SET CHARACTER SET UTF8");
		define('APP_NAME', 'PHP REST API');
				// echo "Connected successfully";
	} catch(PDOException $e) {
				// echo "Connection failed: " . $e->getMessage();
	}

	// try {
	// 	$this->conn = new PDO("mysql:host=".$this->servername.";dbname=".$this->dbname."", $this->username, $this->password);
	//   			// set the PDO error mode to exception
	// 	$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	// 	define('APP_NAME', 'PHP REST API');
	// 			// echo "Connected successfully";
	// } catch(PDOException $e) {
	// 			// echo "Connection failed: " . $e->getMessage();
	// }


?>