
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.28.0"
    }
  }
}

# Configure the Microsoft Azure provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

resource "azurerm_lighthouse_definition" "cg_lh_def" {
  name               = "${var.var_lighthouse_definition_name}"
  description        = "${var.var_lighthouse_definition_description}"
  managing_tenant_id = "${var.var_lighthouse_managing_tenant_id}"
  scope              = "/subscriptions/${var.var_lighthouse_managed_subscription_id}"

  authorization {
    principal_id           = "${var.var_lighthouse_principal_id}"
    role_definition_id     = "${var.var_lighthouse_role_definition_id}"
    principal_display_name = "${var.var_lighthouse_principal_display_name}"
  }
}

resource "azurerm_lighthouse_assignment" "cg_lh_asn" {
  scope                    = var.var_lighthouse_managed_scope_resourcegroup_name != "" ? "${azurerm_lighthouse_definition.cg_lh_def.scope}/resourceGroups/${var.var_lighthouse_managed_scope_resourcegroup_name}" : "${azurerm_lighthouse_definition.cg_lh_def.scope}"
  lighthouse_definition_id = "${azurerm_lighthouse_definition.cg_lh_def.id}"
}