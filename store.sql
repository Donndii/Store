-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 09:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `delivery` varchar(20) DEFAULT NULL,
  `payment` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `order_status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `product_info` text DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_type`, `product_img`, `product_info`, `product_price`) VALUES
(1, 'Java Programming', 'Books', 'images/books/book01.jpg', 'Comprehensive guide to Java programming covering from basics to advanced topics including multithreading and network programming.', 69.80),
(2, 'Python Crash Course', 'Books', 'images/books/book02.jpg', 'Hands-on introduction to programming with Python, perfect for beginners with practical projects.', 99.00),
(3, 'Clean Code Handbook', 'Books', 'images/books/book03.jpg', 'Essential handbook for writing maintainable and efficient code with best practices and principles.', 85.50),
(4, 'Organic Apples', 'Food', 'images/food/food01.jpg', 'Fresh organic apples grown locally, packed with nutrients and perfect for healthy snacks.', 3.99),
(5, 'Whole Grain Bread', 'Food', 'images/food/food02.jpg', 'Freshly baked whole grain bread with no preservatives, rich in fiber and nutrients.', 4.50),
(6, 'Greek Yogurt', 'Food', 'images/food/food03.jpg', 'Creamy Greek yogurt high in protein, perfect for breakfast or as a healthy dessert.', 2.99),
(7, 'Cotton T-Shirt', 'Clothes', 'images/clothes/clothes01.jpg', 'Comfortable 100% cotton t-shirt available in multiple colors, suitable for all seasons.', 19.99),
(8, 'Denim Jeans', 'Clothes', 'images/clothes/clothes02.jpg', 'Classic fit denim jeans with stretch technology for maximum comfort and durability.', 49.99),
(9, 'Winter Jacket', 'Clothes', 'images/clothes/clothes03.jpg', 'Waterproof winter jacket with thermal insulation, perfect for cold weather conditions.', 89.99),
(10, 'Wireless Earbuds', 'Electronics', 'images/electronics/electronics01.jpg', 'High-quality wireless earbuds with noise cancellation and 20-hour battery life.', 129.99),
(11, 'Smart Watch', 'Electronics', 'images/electronics/electronics02.jpg', 'Feature-rich smart watch with health monitoring, GPS, and smartphone notifications.', 199.99),
(12, 'Bluetooth Speaker', 'Electronics', 'images/electronics/electronics03.jpg', 'Portable Bluetooth speaker with 15W output, waterproof design and 12-hour playtime.', 79.99),
(13, 'Ceramic Vase', 'Decoration', 'images/decoration/decoration01.jpg', 'Handcrafted ceramic vase with modern design, perfect for home or office decoration.', 35.00),
(14, 'Wall Art Painting', 'Decoration', 'images/decoration/decoration02.jpg', 'Canvas wall art painting with abstract design, ready to hang with included hardware.', 59.99),
(15, 'Decorative Cushions', 'Decoration', 'images/decoration/decoration03.jpg', 'Set of 3 decorative cushions with premium fabric and various geometric patterns.', 45.00),
(16, 'Leather Sofa', 'Furniture', 'images/furniture/furniture01.jpg', 'Premium genuine leather sofa with comfortable seating and modern design for living rooms.', 899.99),
(17, 'Coffee Table', 'Furniture', 'images/furniture/furniture02.jpg', 'Solid wood coffee table with storage shelf, perfect for modern living spaces.', 249.99),
(18, 'Bookshelf', 'Furniture', 'images/furniture/furniture03.jpg', '5-tier wooden bookshelf with ample storage space for books and decorative items.', 179.99),
(19, 'Building Block Car', 'Toy', 'images/toy/toy01.jpg', 'Educational toy car with 50+ interlocking blocks', 22.99),
(20, 'Remote Control Car', 'Toy', 'images/toy/toy02.jpg', 'High-speed 1:18 scale RC car with 2.4GHz remote', 39.99),
(21, 'Color Spring', 'Toy', 'images/toy/toy03.jpg', 'Vibrant spiral spring toy for kids’ motor skills', 8.99),
(22, 'Green Leather Bag', 'Others', 'images/others/others01.jpg', 'Eco-friendly vegan leather crossbody bag', 49.99),
(23, 'Medical Supply Bag', 'Others', 'images/others/others02.jpg', 'Portable waterproof bag for medical supply', 15.99),
(24, 'Cold Pill', 'Others', 'images/others/others03.jpg', 'Fast-acting relief for cold and flu symptoms', 12.49),
(25, 'Modern Bedding Set', 'Beddings', 'images/beddings/bedding01.jpg', 'Minimalist modern bedding set with neutral colors', 129.99),
(26, 'Cozy Plush Bedding', 'Beddings', 'images/beddings/bedding02.jpg', 'Elegant plush bedding set with tufted design', 149.99),
(27, 'Contemporary Bedding', 'Beddings', 'images/beddings/bedding03.jpg', 'Stylish contemporary bedding set with geometric prints', 139.99);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
