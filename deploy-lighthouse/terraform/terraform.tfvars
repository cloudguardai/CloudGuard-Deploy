# Required variables
# =============================
# Provide the subscription ID within the managed (target) Azure subscription for Lighthouse.
#var_lighthouse_managed_subscription_id = ""




# Optional variables
# =============================
# Optionally, provide the resource group name in the managed subscription that should only be exposed via Azure Lighthouse.
# If this is left blank then all resources in the target subscription will be exposed via Azure Lighthouse to the managing tenant.
#var_lighthouse_managed_scope_resourcegroup_name = ""

# Provide the ID of the role in the managed subscription which will be granted to the managing principal ID.  This can be one of
# the built-in Azure roles or a custom role although if using a custom role, you must ensure that this already exists in the
# target subscription.  Also note, that the built-in Owner role cannot be assigned here.
# For a reference of the built-in roles and the ID should you want to use these:
# https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
#var_lighthouse_role_definition_id = "b24988ac-6180-42a0-ab88-20f7382dd24c" #Contributor




# Further optional variables
# =============================
# Provide a name for the Azure Lighthouse Definition.  A default one is supplied if not defined here.
#var_lighthouse_definition_name = ""

# Provide a friendly description for the Azure Lighthouse Definition (optional).
#var_lighthouse_definition_description = ""

# Provide the ID of the managing Azure tenant.  This would be the MSP Azure tenant ID.
#var_lighthouse_managing_tenant_id = ""

# Provide the principal ID of either the security group, service principal, or user in the managing Azure tenant that will be
# assigned permissions to the managed (target) Azure subscription via Lighthouse.  It is recommended that a group normally be
# used as this makes it easier to share the access to a team from the MSP.  It reduces overheads and places responsibility of
# who can access the target resources for compliance purposes with the MSP.
#var_lighthouse_principal_id = ""

# Provide the friendly name of the principal ID that will be visible in the target subscription.
#var_lighthouse_principal_display_name = ""