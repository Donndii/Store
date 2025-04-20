# Shop

## Description

A simple client-side demonstration built with PHP, HTML, CSS, JavaScript, ajax and sql. It includes:

- shop index page (`index.html`)
- Product listing and details (`shopInfo1.html`)
- Shopping cart management (`shopCart.html`)
- Checkout process with form validation (`pya.html`)
- User login/register functionality  (`login.html`/`register.html`)
- User chang/forgot password (`change_password.html`/`forgot_password.html`)
- Display all products and filter them by price and type (`shopList.html`)

## Prerequisites

- [XAMPP](https://www.apachefriends.org/index.html) installed (Apache and MySQL services)
- A modern web browser (Chrome, Firefox, Edge, Safari)
- Git (optional, for cloning the repository)

## Installation & Setup

1. **Clone this repository** (or download ZIP):

   ```bash
   git clone https://github.com/Donndii/Store.git
   ```
2. **Move the project folder into XAMPP’s `htdocs`** directory:

   - **Windows:**
     ```text
     C:\xampp\htdocs\store
     ```
   - **macOS (using default XAMPP install):**
     ```bash
     sudo cp -R store /Applications/XAMPP/htdocs/
     ```
   - **Linux:**
     ```bash
     sudo cp -R store /opt/lampp/htdocs/
     ```
3. **Import the database into phpMyAdmin**:

   - Open the XAMPP Control Panel and start both **Apache** and **MySQL** services.
   - Click the **“Admin”** button next to MySQL to open **phpMyAdmin**, or go to `http://localhost/phpmyadmin/` in your browser.
   - Create a new database named `store`.
   - Click on the newly created database, then go to the **Import** tab.
   - Select the `store.sql` file from the project folder and click **Go** to import the database structure and data.
4. **Open the application** in your browser:

   ```text
   http://localhost/store/index.html
   ```
