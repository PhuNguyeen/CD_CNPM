<?php

class Category extends Database
{
    // db 
    private $table = 'category';
    // post
    public $categoryID;
    public $categoryAvatar;
    public $categoryName;

    public function __construct()
    {
        $this->connect();
    }
    // Select All User
    public function read()
    {
        // Create query
        $query = 'SELECT * FROM ' . $this->table . ';';
        // prepare statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();

        return $stmt;
    }

    public function loadByID($id){
		// Create query
		$query = 'SELECT * FROM ' . $this->table . ' WHERE categoryID = ? LIMIT 1;';

		// prepare statement
		$stmt = $this->conn->prepare($query);
		// binding param
		$stmt->bindParam(1, $id);
		$stmt->execute();
		if ($stmt->rowCount() == 1) {
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			$this->categoryID = $row['categoryID'];
			$this->categoryAvatar = $row['categoryAvatar'];
			$this->categoryName = $row['categoryName'];
		}
		return $stmt;
    }
}
