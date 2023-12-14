program EmailValidation
    character(256) :: email
    character(256) :: emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    logical :: isValid

    ! Prompt for email input
    write(*, *) "Enter an email address: "
    read(*, *) email

    ! Check if the email matches the pattern
    if (match(email, emailPattern) > 0) then
        ! Convert the email to lowercase
        email = trim(adjustl(translate(email, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")))
        write(*, *) "Valid Email (Lowercase): ", email
    else
        write(*, *) "Invalid Email"
    end if

contains

    pure function match(str, pattern) result(isMatch)
        character(*), intent(in) :: str, pattern
        logical :: isMatch
        integer :: status

        isMatch = .false.
        status = 0

        call execute_command_line("echo '" // trim(str) // "' | grep -E '" // trim(pattern) // "' > /dev/null", status)

        if (status == 0) then
            isMatch = .true.
        end if
    end function match

end program EmailValidation
