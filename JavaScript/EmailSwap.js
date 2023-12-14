const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function validateAndLowercaseEmail(email) {
  // Regular expression for email validation
  const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

  if (email.match(emailPattern)) {
    // Convert the email to lowercase
    email = email.toLowerCase();
    console.log(`Valid Email (Lowercase): ${email}`);
  } else {
    console.log("Invalid Email");
  }
}

rl.question("Enter an email address: ", function(email) {
  validateAndLowercaseEmail(email);
  rl.close();
});
