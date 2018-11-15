<?php
$servername = "localhost";
$username = "check";
$password = "rDEetGxq82DCE";

function getRows($conn) {
	$statement = $conn->query("SELECT count(*) from `log`");
	$result = $statement->fetchColumn(0);
	return $result;
}

function getLastText($conn) {
	 $statement = $conn->query("
                SELECT text
                FROM `log`
                ORDER BY date DESC
                LIMIT 1
        ");
        $result = $statement->fetchColumn(0);
	return $result;
}

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ _';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function insertRandom($conn) {
	$statement = $conn->prepare("INSERT INTO `log` (date, text) values (now(), :text)");
	$statement->bindParam(":text", generateRandomString());
	$statement->execute();
}

function limitTo80($conn) {
	$query = "DELETE FROM `log` WHERE text NOT IN ( SELECT text FROM ( SELECT text FROM `log` ORDER BY date DESC LIMIT 80 ) as t )";
	$statement = $conn->prepare($query);
	$statement->execute();
}

try {
	$conn = new \PDO("mysql:host=$servername;dbname=check", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$rows = getRows($conn);
	// Make sure we have atleast 80 rows and max 100
	if($rows < 80) {
		try {
			$conn->beginTransaction();
			for($i = $rows; $i < 80; $i++) insertRandom($conn);
			$conn->commit();
		} catch(\PDOException $e) {
			$conn->rollback();
		}	
	} else if($rows >= 100) {
		try {
			$conn->beginTransaction();
			limitTo80($conn);
			$conn->commit();
		} catch(\PDOException $e) {
			$conn->rollback();
		}
	}
	echo getLastText($conn);
} catch(\PDOException $e) {
	echo "Connection failed " . $e->getMessage();
}
echo "\n";
