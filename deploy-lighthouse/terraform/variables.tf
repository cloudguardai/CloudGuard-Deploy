# List of variables to be used along with defaults.
# Do not update these for single run customisation - update the variables using terraform.tfvars instead

variable "var_lighthouse_definition_id" {
    description = "(Optional) NOT USED A unique UUID/GUID which identifies this Lighthouse Definition - one will be generated automatically if not specified"
    default     = ""
}

variable "var_lighthouse_definition_name" {
    description = "(Required) The name of the Lighthouse Definition"
    default     = "Lighthouse-Cloudguard-SOC"
}

variable "var_lighthouse_definition_description" {
    description = "(Optional) A description of the Lighthouse Definition"
    default     = "Azure Lighthouse definition from the Cloudguard AI tenant for providing agreed SOC related services"
}

variable "var_lighthouse_managing_tenant_id" {
    description = "(Required) The ID of the managing tenant.  By default this is the Cloudguard tenant"
    default     = "437026fb-9437-4952-bc67-cb19cd2a8612"
}

variable "var_lighthouse_managed_subscription_id" {
    description = "(Required) The ID of the managed subscription"
}

variable "var_lighthouse_managed_scope_resourcegroup_name" {
    description = "(Optional) The name of the resource group in the managed subscription to provide access to via Lighthouse"
    default     = ""
}



# lighthouse_definition authorization block
variable "var_lighthouse_principal_id" {
    description = "(Required) The principal ID of the security group / service principal / user in the managing tenant that will be assigned permissions to the managed subscription"
    default     = "264e314d-232d-403c-845e-b35ca1754648"
}

variable "var_lighthouse_role_definition_id" {
    description = "(Required) The ID of the role in the managed tenant that will be granted to the principal in the managing tenant.  This cannot be an owner role.  The default provided is Reader"
    default = "acdd72a7-3385-48ef-bd42-f606fba81ae7"
}

variable "var_lighthouse_delegated_role_definition_ids" {
    description = "(Optional) NOT USED The set of role definition IDs which define all the permissions that the principal ID can assign"
    default     = ""
}

variable "var_lighthouse_principal_display_name" {
    description = "(Optional) The display name of the security group / service principal / user in the managing tenant that will be assigned permissions to the managed subscription"
    default     = "CloudGuard SOC Team"
}
# end lighthouse_definition authorization block

