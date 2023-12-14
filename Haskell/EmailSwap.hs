import Text.Regex.Posix
import Data.Char (toLower)
import Control.Monad (when)

main :: IO ()
main = do
    putStrLn "Enter an email address: "
    email <- getLine

    let emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        isValid = email =~ emailPattern :: Bool

    if isValid
        then do
            let lowercaseEmail = map toLower email
            putStrLn $ "Valid Email (Lowercase): " ++ lowercaseEmail
        else
            putStrLn "Invalid Email"
