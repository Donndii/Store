<?php
header("Content-Type: application/json");
$conn = new mysqli("localhost", "root", "", "store");
if ($conn->connect_error) {
  die(json_encode(["error" => "DB connect failed"]));
}

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$sql = "SELECT * FROM products WHERE id = $id";
$result = $conn->query($sql);

if ($row = $result->fetch_assoc()) {
  echo json_encode($row);
} else {
  echo json_encode(["error" => "Product not found"]);
}
$conn->close();
?>