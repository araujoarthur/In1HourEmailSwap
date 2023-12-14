package main

import (
	"fmt"
	"regexp"
	"strings"
)

func main() {
	var email string
	fmt.Print("Enter an email address: ")
	fmt.Scanln(&email)

	// Regular expression for email validation
	emailPattern := "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
	validEmail := regexp.MustCompile(emailPattern)

	if validEmail.MatchString(email) {
		// Convert the email to lowercase
		email = strings.ToLower(email)
		fmt.Printf("Valid Email (Lowercase): %s\n", email)
	} else {
		fmt.Println("Invalid Email")
	}
}
