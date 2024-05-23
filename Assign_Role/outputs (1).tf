output "assigned_users" {
  value = [for user in btp_subaccount_role_collection_assignment.role-assign : user.user_name]
}

output "assigned_roles" {
  value = [for user in btp_subaccount_role_collection_assignment.role-assign : user.role_collection_name]
}
