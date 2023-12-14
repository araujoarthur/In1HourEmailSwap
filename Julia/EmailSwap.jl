import Base.Iterators: flatten
import Libc

function validate_and_lowercase_email()
    email = readline(stdin)

    # Regular expression for email validation
    email_pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

    if occursin(email_pattern, email)
        # Convert the email to lowercase
        email = lowercase(email)
        println("Valid Email (Lowercase): ", email)
    else
        println("Invalid Email")
    end
end

validate_and_lowercase_email()
