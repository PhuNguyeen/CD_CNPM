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

	public function read_signle(){
		// Create query
		$query = 'SELECT * FROM '. $this->table .' u WHERE u.userPhone = ? and u.userPass = ? LIMIT 1;';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		// binding param
		$stmt->bindParam(1, $this->userPhone);
		$stmt->bindParam(2, $this->userPass);
		$stmt->execute();

		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		$this->userID = $row['userID'];
		$this->userName = $row['userName'];
		$this->userEmail = $row['userEmail'];
		$this->userAvatar = $row['userAvatar'];
		$this->userRole = $row['userRole'];

		return $stmt;
	}
}
?>