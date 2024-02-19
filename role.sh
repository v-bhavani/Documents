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



----------------------------------------------------------------ROLE DELETION-----------------------------------------------------------------------------------

#!/bin/bash

# Prompt for user's email address
USER_EMAIL="irfana.j@basiscloudsolutions.com"

# Prompt for role to delete
ROLE="Reader"

# Prompt for subscription ID
SCOPE="/subscriptions/bf18f464-1469-4216-834f-9c6694dbfe26/resourceGroups/cloud-demo/providers/Microsoft.Compute/virtualMachines/ansible-test"

# Get the role assignment ID
ROLE_ASSIGNMENT_ID=$(az role assignment list --assignee "$USER_EMAIL" --role "$ROLE" --scope "$SCOPE" --query '[].id' -o tsv)

# Check if the role assignment exists
if [ -z "$ROLE_ASSIGNMENT_ID" ]; then
    echo "Role '$ROLE' for user with email address '$USER_EMAIL' doesn't exist in subscription '$SCOPE'"
else
    # Delete the role assignment
    az role assignment delete --ids "$ROLE_ASSIGNMENT_ID"
    echo "Role '$ROLE' has been deleted for user with email address '$USER_EMAIL' in subscription '$SCOPE'"
fi
