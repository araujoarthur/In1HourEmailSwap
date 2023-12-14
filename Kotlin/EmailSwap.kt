import java.util.regex.Pattern

fun main() {
    print("Enter an email address: ")
    val email = readLine()

    // Regular expression for email validation
    val emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
    val regex = Pattern.compile(emailPattern)

    if (email != null && regex.matcher(email).matches()) {
        // Convert the email to lowercase
        val lowercaseEmail = email.toLowerCase()
        println("Valid Email (Lowercase): $lowercaseEmail")
    } else {
        println("Invalid Email")
    }
}
