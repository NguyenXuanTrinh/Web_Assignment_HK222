<?php
$hostName = 'localhost';
$userName = 'root';
$password = 'Trinh2s$haha';
$database = 'assignmentweb';
$conn = @new mysqli( $hostName, $userName, $password, $database);
$conn->error;
if ($conn->error) {
    die('Kết nối thất bại !!! '.$conn->error);
} 
?>