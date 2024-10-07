<?php require_once 'core/dbConfig.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
  
    <!-- Selecting all customers from the table -->
    <?php
        $stmt = $pdo->prepare("SELECT * FROM customers");
        
    // Execute the query and display results
        if ($stmt->execute()) {
            echo "<pre>";
            print_r($stmt->fetchAll()); // Print all data in customers table
            echo "<pre>";
        }
    ?>

  <!-- Selecting all orders from the table -->
    <?php
        $stmt = $pdo->prepare("SELECT * FROM orders");

        // Execute the query and display results
        if ($stmt->execute()) {
            echo "<pre>";
            print_r($stmt->fetch()); // Print the first row of data in orders table
            echo "<pre>";
        }
    ?>

   <!-- Inserting a new user to the table -->
    <?php
    // SQL query to insert a new customer to the customers table
        $query = "INSERT INTO customers (customer_id, first_name, last_name, email, phone_number, shipping_address) 
                VALUES (?, ?, ?, ?, ?, ?)";
        
        $stmt = $pdo->prepare($query);
        
    // Execute the query to substitute placeholders with new data
        $executeQuery = $stmt->execute(
            [6, "Ayaka", "Kamisato", "ayaka.kamisato@example.com", "555-0616", "123 Kamisato Estate, Inazuma"]
        );
        
    // Check if the insertion is successful
        if($executeQuery) {
            echo "Query successful!";
        } else {
            echo "Query failed!";
        }
    ?>

  <!-- Deleting a user from the table -->
    <?php
        $query = "DELETE FROM customers 
                WHERE customer_id = 6
            ";
        
        $stmt = $pdo->prepare($query);
        
        $executeQuery = $stmt->execute();   
        
    // Check if the deletion is successful
        if($executeQuery) {
            echo "Deletion successful!";
        } else {
            echo "Query failed!";
        }
    ?>

  <?php require_once 'core/dbConfig.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <!-- Updating a user from the table -->
    <?php
        // SQL query to update an existing user to the customers table
        $query = "UPDATE customers 
            SET first_name = ?, last_name = ?, email = ?, phone_number = ?, shipping_address = ? 
            WHERE customer_id = 1
            ";
    
    $stmt = $pdo->prepare($query);
        
    $executeQuery = $stmt->execute(
            ["Raine", "Caldo", "rainelouise.caldo.cvt@eac.edu.ph", "555-1234", "Nia Road Salawag Dasmarinas, Cavite"]
        );
        
    // Check if the update is successful
        if ($executeQuery) {
            echo "Update successful!";
        } else {
            echo "Query failed!";
        }
    ?>

   <h2>CUSTOMERS TABLE</h2>

    <table border="1">
        <tr>
            <th>customer_id</th>
            <th>first_name</th>
            <th>last_name</th>
            <th>email</th>
            <th>phone_number</th>
            <th>shipping_address</th>
        </tr>

        <?php
        $stmt = $pdo->prepare("SELECT * FROM customers");

            // Fetch all results as an associative array
            if ($stmt->execute()) {
                $customers = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Loop through each customer and create a table row
                foreach ($customers as $customer) { ?>
                    <tr>
                        <td><?php echo $customer['customer_id']; ?></td>
                        <td><?php echo $customer['first_name']; ?></td>
                        <td><?php echo $customer['last_name']; ?></td>
                        <td><?php echo $customer['email']; ?></td>
                        <td><?php echo $customer['phone_number']; ?></td>
                        <td><?php echo $customer['shipping_address']; ?></td>
                    </tr>
                <?php }
            } else {
                echo "<tr><td colspan='6'>No customers found.</td></tr>";
            }
        ?>
    </table>

</body>
</html>
