<?php
$conn = new mysqli("localhost", "root", "", "store");
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$username = trim($_POST['username']);
$oldPassword = $_POST['old_password'];
$newPassword = $_POST['new_password'];
$confirm = $_POST['confirm_password'];

if ($newPassword !== $confirm) {
  die("<script>alert('Passwords do not match.'); history.back();</script>");
}

// Find account (supports username or email)
$stmt = $conn->prepare("SELECT password FROM users WHERE username = ? OR email = ?");
$stmt->bind_param("ss", $username, $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user || !password_verify($oldPassword, $user['password'])) {
  die("<script>alert('Original password incorrect or user not found.'); history.back();</script>");
}

// Update password
$newHashed = password_hash($newPassword, PASSWORD_DEFAULT);
$stmt = $conn->prepare("UPDATE users SET password = ? WHERE username = ? OR email = ?");
$stmt->bind_param("sss", $newHashed, $username, $username);
$stmt->execute();

echo "<script>alert('Password updated successfully!'); window.location.href='login.html';</script>";
$stmt->close();
$conn->close();
?>