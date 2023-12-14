       IDENTIFICATION DIVISION.
       PROGRAM-ID. EmailValidation.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMAIL-ADDRESS PIC X(256).
       01 EMAIL-LENGTH PIC 9(3).
       01 I PIC 9(3).

       PROCEDURE DIVISION.
           DISPLAY "Enter an email address: ".
           ACCEPT EMAIL-ADDRESS.

           MOVE FUNCTION LENGTH(EMAIL-ADDRESS) TO EMAIL-LENGTH.

           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > EMAIL-LENGTH
               IF EMAIL-ADDRESS(I:I) IS NUMERIC OR
                  EMAIL-ADDRESS(I:I) IS ALPHABETIC OR
                  EMAIL-ADDRESS(I:I) IS "." OR
                  EMAIL-ADDRESS(I:I) IS "-" OR
                  EMAIL-ADDRESS(I:I) IS "_"
               THEN
                   CONTINUE
               ELSE
                   DISPLAY "Invalid Email"
                   GOBACK
               END-IF
           END-PERFORM

           MOVE FUNCTION LOWER-CASE(EMAIL-ADDRESS) TO EMAIL-ADDRESS.

           DISPLAY "Valid Email (Lowercase): " EMAIL-ADDRESS.

           STOP RUN.
