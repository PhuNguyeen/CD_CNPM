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
}
