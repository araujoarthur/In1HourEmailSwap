Imports System.Text.RegularExpressions

Module Program
    Sub Main()
        Console.Write("Enter an email address: ")
        Dim email As String = Console.ReadLine()

        ' Regular expression for email validation
        Dim emailPattern As String = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
        Dim regex As New Regex(emailPattern)

        If regex.IsMatch(email) Then
            ' Convert the email to lowercase
            email = email.ToLower()
            Console.WriteLine("Valid Email (Lowercase): " & email)
        Else
            Console.WriteLine("Invalid Email")
        End If
    End Sub
End Module
