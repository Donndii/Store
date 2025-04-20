<?php
$conn = new mysqli("localhost", "root", "", "store");
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$email = trim($_POST['email']);
$newPassword = $_POST['new_password'];
$confirm = $_POST['confirm_password'];

if ($newPassword !== $confirm) {
  die("<script>alert('Passwords do not match.'); history.back();</script>");
}

$hashed = password_hash($newPassword, PASSWORD_DEFAULT);
$stmt = $conn->prepare("UPDATE users SET password=? WHERE email=?");
$stmt->bind_param("ss", $hashed, $email);
$stmt->execute();

if ($stmt->affected_rows > 0) {
  echo "<script>alert('Password reset successful!'); window.location.href='login.html';</script>";
} else {
  echo "<script>alert('Email not found.'); history.back();</script>";
}
$stmt->close();
$conn->close();
?>