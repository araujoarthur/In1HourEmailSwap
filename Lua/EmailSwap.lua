-- Function to validate and lowercase an email address
function validateAndLowercaseEmail(email)
    -- Check for the "@" symbol
    local atIndex = string.find(email, "@")
    if not atIndex then
        return "Invalid Email"
    end

    -- Split the email into local part and domain part
    local localPart = string.sub(email, 1, atIndex - 1)
    local domainPart = string.sub(email, atIndex + 1)

    -- Check local part and domain part for valid characters
    local validLocal = string.match(localPart, "^[a-zA-Z0-9._%+-]+$")
    local validDomain = string.match(domainPart, "^[a-zA-Z0-9.-]+$")

    if not validLocal or not validDomain then
        return "Invalid Email"
    end

    -- Convert the email to lowercase
    email = string.lower(email)
    return "Valid Email (Lowercase): " .. email
end

-- Read and validate an email address
io.write("Enter an email address: ")
local email = io.read()

-- Validate and display the result
local result = validateAndLowercaseEmail(email)
print(result)
