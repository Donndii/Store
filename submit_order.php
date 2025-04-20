<?php
$conn = new mysqli("localhost", "root", "", "store");
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$orderData = json_decode($_POST['orderData'], true);

// Extract data
$username = $orderData['customer']['addressName'];
$phone = $orderData['customer']['phone'];
$address = $orderData['customer']['province'] . $orderData['customer']['city'] . $orderData['customer']['district'] . $orderData['customer']['detail'];
$email = $orderData['customer']['email'];
$delivery = $orderData['delivery'];
$payment = $orderData['payment'];
$message = $orderData['message'];
$total = $orderData['total'];

$items = $orderData['items'];

// Write each item as a separate row (merged table)
foreach ($items as $item) {
  $stmt = $conn->prepare("INSERT INTO orders (username, phone, address, email, delivery, payment, message, product_name, product_price, product_quantity, total_price, order_date, order_status) 
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), 'Pending')");
  $stmt->bind_param("ssssssssidi", $username, $phone, $address, $email, $delivery, $payment, $message, $item['name'], $item['unitPrice'], $item['num'], $total);
  $stmt->execute();
}


echo "<script>alert('Order submitted successfully!'); location.href='index.html';</script>";
?>