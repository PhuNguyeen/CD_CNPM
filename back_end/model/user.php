<?php 
/**
 * 
 */

class User extends Database
{
	// db 
	private $table = 'user';
	// post
	public $userID;
	public $userName;
	public $userPhone;
	public $userPass;
	public $userEmail;
	public $userAvatar;
	public $userRole;


	public function __construct()
	{
		$this->connect();
	}
	// Select All User
	public function read(){
		// Create query
		$query = 'SELECT * FROM '.$this->table.';';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		// execute query
		$stmt->execute();

		return $stmt;

	}
	// Select user by userPhone and userPass
	public function read_single(){
		// Create query
		$query = 'SELECT * FROM '. $this->table .' u WHERE u.userPhone = ? LIMIT 1;';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		// binding param
		$stmt->bindParam(1, $this->userPhone);
		$stmt->execute();
		if ($stmt->countRow() == 1) {
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			$this->userID = $row['userID'];
			$this->userName = $row['userName'];
			$this->userPass = $row['userPass'];
			$this->userEmail = $row['userEmail'];
			$this->userAvatar = $row['userAvatar'];
			$this->userRole = $row['userRole'];
		}
		

		return $stmt;
	}
	// Create User
	public function create(){
		// Create query
		$query = 'INSERT INTO '.$this->table.' SET 
		userName = :userName,
		userPhone = :userPhone,
		userPass = :userPass,
		userEmail = :userEmail,
		userAvatar = :userAvatar,
		userRole = :userRole;';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		
		// Clean data
		$this->cleanData();
		
		// binding param
		$stmt->bindParam(':userName', $this->userName);
		$stmt->bindParam(':userPhone', $this->userPhone);
		$stmt->bindParam(':userPass', $this->userPass);
		$stmt->bindParam(':userEmail', $this->userEmail);
		$stmt->bindParam(':userAvatar', $this->userAvatar);
		$stmt->bindParam(':userRole', $this->userRole);

		if ($stmt->execute()) {
			return true;
		}
		echo 'Error: '.$stmt->error;
		return false;
	}
	// Update User
	public function update(){
		// Create query
		$query = 'UPDATE '.$this->table.' SET 
		userName = :userName,
		userPhone = :userPhone,
		userPass = :userPass,
		userEmail = :userEmail,
		userAvatar = :userAvatar,
		userRole = :userRole 
		WHERE userID = :userID;';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		
		// Clean data
		$this->cleanData();

		// binding param
		$stmt->bindParam(':userName', $this->userName);
		$stmt->bindParam(':userPhone', $this->userPhone);
		$stmt->bindParam(':userPass', $this->userPass);
		$stmt->bindParam(':userEmail', $this->userEmail);
		$stmt->bindParam(':userAvatar', $this->userAvatar);
		$stmt->bindParam(':userRole', $this->userRole);
		$stmt->bindParam(':userID', $this->userID);

		if ($stmt->execute()) {
			return true;
		}
		echo 'Error: '.$stmt->error;
		return false;
	}
	// Delete User
	public function delete(){
		// Create query
		$query = 'DELETE FROM '.$this->table.' WHERE userID = :userID;';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		
		// Clean data
		$this->cleanData();

		// binding param
		$stmt->bindParam(':userID', $this->userID);

		if ($stmt->execute()) {
			return true;
		}
		echo 'Error: '.$stmt->error;
		return false;
	}

	public function cleanData(){
		// Clean data
		$this->userName 	= htmlspecialchars(strip_tags($this->userName));
		$this->userPhone 	= htmlspecialchars(strip_tags($this->userPhone));
		$this->userPass 	= htmlspecialchars(strip_tags($this->userPass));
		$this->userEmail 	= htmlspecialchars(strip_tags($this->userEmail));
		$this->userAvatar 	= htmlspecialchars(strip_tags($this->userAvatar));
		$this->userRole 	= htmlspecialchars(strip_tags($this->userRole));
		$this->userID 	= htmlspecialchars(strip_tags($this->userID));
	}
}
