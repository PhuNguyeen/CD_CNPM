<?php

class Manufacturer extends Database
{
    // db 
    private $table = 'manufacturer';
    // post
    public $manufacturerID;
    public $manufacturerAvatar;
    public $manufacturerName;

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
