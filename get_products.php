<?php
header("Content-Type: application/json");
$conn = new mysqli("localhost", "root", "", "store");
if ($conn->connect_error) {
  die("連線錯誤: " . $conn->connect_error);
}
$sql = "SELECT id, product_name, product_price, product_img, product_type FROM products";
$result = $conn->query($sql);

$products = [];
while ($row = $result->fetch_assoc()) {
  $products[] = $row;
}
echo json_encode($products);
$conn->close();
?>