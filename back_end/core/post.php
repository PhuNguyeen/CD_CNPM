<?php 
/**
 * 
 */
class Post
{
	// db 
	private $conn;
	private $table = 'user';
	// post
	public $userID;
	public $userName;
	public $userPhone;
	public $userPass;
	public $userEmail;
	public $userAvatar;
	public $userRole;


	public function __construct($db)
	{
		$this->conn = $db;
	}

	public function read(){
		// Create query
		$query = 'SELECT * FROM '.$this->table.';';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		// execute query
		$stmt->execute();

		return $stmt;

	}
}
?>