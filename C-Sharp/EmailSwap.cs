using System;
using System.Text.RegularExpressions;

class Program
{
    static void Main()
    {
        Console.Write("Enter an email address: ");
        string email = Console.ReadLine();

        // Regular expression for email validation
        string emailPattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
        Regex regex = new Regex(emailPattern);

        if (regex.IsMatch(email))
        {
            // Convert the email to lowercase
            email = email.ToLower();
            Console.WriteLine("Valid Email (Lowercase): " + email);
        }
        else
        {
            Console.WriteLine("Invalid Email");
        }
    }
}
