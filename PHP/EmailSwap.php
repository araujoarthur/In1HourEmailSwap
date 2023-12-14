<?php
function validateAndLowercaseEmail() {
    // Read the email address from user input
    echo "Enter an email address: ";
    $email = trim(fgets(STDIN));

    // Regular expression for email validation
    $emailPattern = '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/';

    if (preg_match($emailPattern, $email)) {
        // Convert the email to lowercase
        $email = strtolower($email);
        echo "Valid Email (Lowercase): $email\n";
    } else {
        echo "Invalid Email\n";
    }
}

validateAndLowercaseEmail();
?>
