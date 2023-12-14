import 'dart:io';

void main() {
  stdout.write("Enter an email address: ");
  String email = stdin.readLineSync()!.trim();

  // Regular expression for email validation
  RegExp emailPattern = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  if (emailPattern.hasMatch(email)) {
    // Convert the email to lowercase
    email = email.toLowerCase();
    print("Valid Email (Lowercase): $email");
  } else {
    print("Invalid Email");
  }
}
