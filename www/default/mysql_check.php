<?php
$servername = "localhost";
$username = "check";
$password = "rDEetGxq82DCE";

try {
	$conn = new \PDO("mysql:host=$servername;dbname=check", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	echo "Connected successfully";
} catch(\PDOException $e) {
	echo "Connection failed " . $e->getMessage();
}
