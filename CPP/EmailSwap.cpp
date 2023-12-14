#include <iostream>
#include <string>
#include <regex>
#include <algorithm>

int main() {
    std::string email;

    // Prompt for email input
    std::cout << "Enter an email address: ";
    std::cin >> email;

    // Regular expression for email validation
    std::regex emailPattern("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");

    // Check if the email matches the pattern
    if (std::regex_match(email, emailPattern)) {
        // Convert the email to lowercase
        std::transform(email.begin(), email.end(), email.begin(), ::tolower);
        std::cout << "Valid Email (Lowercase): " << email << std::endl;
    } else {
        std::cout << "Invalid Email" << std::endl;
    }

    return 0;
}
