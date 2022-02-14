This will deploy Azure Lighthouse into your Azure tenant as simply as possible and grant Cloudguard access to a selected subscription of yours, and optionally locked down to a single resource group.

By default it will ask for your subscription ID that you wish to grant Cloudguard access to, and full reader access will be granted via Lighthouse.

You can alternatively modify the first few lines of the terraform.tfvars file and specify a resource group witin the subscription to allow access to, along with a different role to Reader if required.

Requirements:
 - Azure CLI v2.32.0 (tested) - may work with older versions
 - terraform v1.1.5 (tested) - may work with v0.15 but is untested


If you're happy to grant Cloudguard access to one of your subscriptions with reader only access, then simply run the below commands.  Otherwise, update the terraform.tfvars file with the required variables accordingly before proceeding.

```
az login
az account set --subscription <subscription-id-in-managed-tenant-to-deploy-Azure-Lighthouse-to>
terraform init
terraform apply
```

You will need to wait several minutes once the Lighthouse assignment has been created before it will show up.
This will be visible on the managed tenant under "Azure Lighthouse --> View service provider offers --> Service provider offers / Delegations"
From the managing tenant it will be visible under "Azure Lighthouse --> Manage your customers --> Customers / Delegations"
Under the access control (IAM) for the managed subscription / resource group, there will be a new role assignment for the user/group/SPN specified under the selected role with a type of "User-assigned Managed Identity".


From an MSP perspective, the security group or user or service principal needs to exist in the MSP tenant before starting.
It is strongly recommended to use a security group.  You will need to first ensure this is created in the MSP tenant and ensure users are assigned to the group if you wish to use a different principal ID to what is supplied by default.  As an MSP, you may also wish to supply other recommended values in the terraform.tfvars file and supply this to customers in advance.