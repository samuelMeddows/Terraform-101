resource "tls_private_key" "vm1" {
    algorithm = "RSA"
    rsa_bits  = 2048
}

data "azurerm_key_vault" "main" {
  name                = "kv-devops-dev-bxopjs"
  resource_group_name = "rg-devops-dev"
}

resource "azurerm_key_vault_secret" "vm1_ssh_private" {
  name         = "azapivm-ssh-private"
  value        = tls_private_key.vm1.private_key_pem
  key_vault_id = data.azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "vm1_ssh_public" {
  name         = "azapivm-ssh-public"
  value        = tls_private_key.vm1.public_key_openssh
  key_vault_id = data.azurerm_key_vault.main.id
}

