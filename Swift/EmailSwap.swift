import Foundation

func validateAndLowercaseEmail(_ email: String) -> String {
    let emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
    
    if let range = email.range(of: emailPattern, options: .regularExpression) {
        let validEmail = email[range]
        return validEmail.lowercased()
    } else {
        return "Invalid Email"
    }
}

print("Enter an email address: ")
if let email = readLine() {
    let result = validateAndLowercaseEmail(email)
    print(result)
}
