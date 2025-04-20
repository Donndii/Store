<?php
session_start();
$conn = new mysqli("localhost", "root", "", "store");
if ($conn->connect_error) {
  die("❌ Connection failed: " . $conn->connect_error);
}

// Print received data

$username = trim($_POST['username']);
$email = trim($_POST['email']);
$password = $_POST['password'];

if (empty($username) || empty($email) || empty($password)) {
  die("❌ All fields are required");
}

// Check if account exists
$stmt = $conn->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
$stmt->bind_param("ss", $username, $email);
$stmt->execute();
$stmt->store_result();
if ($stmt->num_rows > 0) {
  die("❌ Username or Email already exists!");
}
$stmt->close();

// Hash password
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// Prepare INSERT
$stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
if (!$stmt) {
  die("❌ Prepare failed: " . $conn->error);
}
$stmt->bind_param("sss", $username, $email, $hashedPassword);

// Execute write
if (!$stmt->execute()) {
  die("❌ Execution failed: " . $stmt->error);
}

$_SESSION['user'] = $username;
echo "<script>
        alert('Registration successful!');
        window.location.href = 'login.html';
      </script>";

$stmt->close();
$conn->close();
?>