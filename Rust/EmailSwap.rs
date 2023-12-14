use regex::Regex;
use std::io;

fn main() {
    println!("Enter an email address:");
    let mut email = String::new();
    io::stdin().read_line(&mut email).expect("Failed to read line");

    // Regular expression for email validation
    let email_pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    let re = Regex::new(email_pattern).expect("Invalid regex pattern");

    if re.is_match(&email) {
        // Convert the email to lowercase
        let lowercase_email = email.to_lowercase();
        println!("Valid Email (Lowercase): {}", lowercase_email);
    } else {
        println!("Invalid Email");
    }
}
