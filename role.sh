----------------------------------------------------------------ROLE ASSIGNMENT------------------------------------------------------------------------------------

#!/bin/bash

# Prompt for user's email address
USER_EMAIL="$Userid"

# Prompt for role to assign
ROLE="$Role"

# Prompt for subscription ID
SCOPE="$Scope"

# Check if the role assignment already exists
if az role assignment list --assignee "$USER_EMAIL" --role "$ROLE" --scope "$SCOPE" &> /dev/null; then
    echo "Role '$ROLE' is already assigned to user with email address '$USER_EMAIL' in '$SCOPE'"
else
    # Assign role to the user
    if az role assignment create --assignee "$USER_EMAIL" --role "$ROLE" --scope "$SCOPE"; then
        echo "Role '$ROLE' has been successfully assigned to user with email address '$USER_EMAIL' in '$SCOPE'"
    else
        echo "Failed to assign role '$ROLE' to user with email address '$USER_EMAIL' in '$SCOPE'"
    fi
fi
