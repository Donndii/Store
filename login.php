<?php
session_start();
$conn = new mysqli("localhost", "root", "", "store");

if ($conn->connect_error) {
  header('Content-Type: application/json');
  echo json_encode(['success' => false, 'message' => "Database connection failed: " . $conn->connect_error]);
  exit;
}

$username = trim($_POST['username']);
$password = $_POST['password'];

if (empty($username) || empty($password)) {
  header('Content-Type: application/json');
  echo json_encode(['success' => false, 'message' => "Please enter your username and password"]);
  exit;
}

$sql = "SELECT * FROM users WHERE username = ? OR email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $username, $username);
$stmt->execute();
$result = $stmt->get_result();

header('Content-Type: application/json');

if ($user = $result->fetch_assoc()) {
  if (password_verify($password, $user['password'])) {
    $_SESSION['user'] = $user['username'];
    echo json_encode([
      'success' => true,
      'username' => $user['username'],
      'email' => $user['email']
    ]);
  } else {
    echo json_encode(['success' => false, 'message' => "Incorrect password"]);
  }
} else {
  echo json_encode(['success' => false, 'message' => "Account does not exist"]);
}

$stmt->close();
$conn->close();
?>