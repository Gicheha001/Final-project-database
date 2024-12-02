USE cappuchino_db;

-- Check for Customers Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Customers';

IF @table_exists = 0 THEN
CREATE TABLE Customers (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE,
        phone VARCHAR(20),
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Check for Menu Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Menu';

IF @table_exists = 0 THEN
    CREATE TABLE Menu (
        menu_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description TEXT,
        price DECIMAL(10, 2) NOT NULL,
        category VARCHAR(100),
        availability VARCHAR(50) DEFAULT 'available'
    );
END IF;

-- Check for Orders Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Orders';

IF @table_exists = 0 THEN
    CREATE TABLE Orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        status VARCHAR(50) DEFAULT 'pending',
        total_price DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
    );
END IF;

-- Check for Order_Details Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Order_Details';

IF @table_exists = 0 THEN
    CREATE TABLE Order_Details (
        order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
        order_id INT NOT NULL,
        menu_id INT NOT NULL,
        quantity INT NOT NULL,
        sub_total DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
        FOREIGN KEY (menu_id) REFERENCES Menu(menu_id) ON DELETE CASCADE
    );
END IF;

-- Check for Employees Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Employees';

IF @table_exists = 0 THEN
    CREATE TABLE Employees (
        employee_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        role VARCHAR(100) NOT NULL,
        hire_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        phone VARCHAR(20)
    );
END IF;

-- Check for Inventory Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Inventory';

IF @table_exists = 0 THEN
    CREATE TABLE Inventory (
        inventory_id INT AUTO_INCREMENT PRIMARY KEY,
        item_name VARCHAR(255) NOT NULL,
        quantity INT NOT NULL,
        unit VARCHAR(50),
        last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        status VARCHAR(50) DEFAULT 'in stock'
    );
END IF;

-- Check for Suppliers Table
SELECT COUNT(*)
INTO @table_exists
FROM information_schema.tables
WHERE table_schema = 'cappuccino_db' AND table_name = 'Suppliers';

IF @table_exists = 0 THEN
    CREATE TABLE Suppliers (
        supplier_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        contact VARCHAR(100),
        address TEXT,
        items_supplied TEXT
    );
END IF;
