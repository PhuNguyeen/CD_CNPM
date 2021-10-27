<?php

/**
 * Connect Database
 */
class Database
{
	private $servername = "localhost";
	private $username = "root";
	private $password = "";
	private $dbname = "db_app";
	public $conn;


	function connect()
	{
		try {
			$this->conn = new PDO("mysql:host=" . $this->servername . ";dbname=" . $this->dbname . "", $this->username, $this->password, array('charset' => 'utf8'));
			// set the PDO error mode to exception
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$this->conn->query("SET CHARACTER SET UTF8");

			// echo "Connected successfully";
		} catch (PDOException $e) {
			// echo "Connection failed: " . $e->getMessage();
		}
	}
}
