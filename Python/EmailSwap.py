import re

def validate_and_lowercase_email():
    email = input("Enter an email address: ")

    # Regular expression for email validation
    email_pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    
    if re.match(email_pattern, email):
        # Convert the email to lowercase
        email = email.lower()
        print("Valid Email (Lowercase):", email)
    else:
        print("Invalid Email")

validate_and_lowercase_email()
