# Function to validate and lowercase an email address
def validate_and_lowercase_email
    print "Enter an email address: "
    email = gets.chomp
  
    # Regular expression for email validation
    email_pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  
    if email.match?(email_pattern)
      # Convert the email to lowercase
      email = email.downcase
      puts "Valid Email (Lowercase): #{email}"
    else
      puts "Invalid Email"
    end
  end
  
  validate_and_lowercase_email
  