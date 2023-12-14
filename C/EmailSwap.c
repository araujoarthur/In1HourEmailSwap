#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <ctype.h>

int main() {
    char email[256];
    printf("Enter an email address: ");
    scanf("%255s", email);

    // Regular expression for email validation
    regex_t regex;
    int reti = regcomp(&regex, "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", REG_EXTENDED);

    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    reti = regexec(&regex, email, 0, NULL, 0);

    if (!reti) {
        // Email is valid, convert to lowercase
        for (int i = 0; email[i]; i++) {
            email[i] = tolower(email[i]);
        }
        printf("Valid Email (Lowercase): %s\n", email);
    } else {
        printf("Invalid Email\n");
    }

    regfree(&regex);
    return 0;
}
