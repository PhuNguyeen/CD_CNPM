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

    public function loadByID($id)
    {
        // Create query
        $query = 'SELECT * FROM ' . $this->table . ' WHERE manufacturerID = ? LIMIT 1;';

        // prepare statement
        $stmt = $this->conn->prepare($query);
        // binding param
        $stmt->bindParam(1, $id);
        $stmt->execute();
        if ($stmt->rowCount() == 1) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->manufacturerID = $row['manufacturerID'];
            $this->manufacturerAvatar = $row['manufacturerAvatar'];
            $this->manufacturerName = $row['manufacturerName'];
        }
        return $stmt;
    }
}
