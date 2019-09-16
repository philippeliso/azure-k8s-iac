# Managed Azure Kubernete Service
resource "azurerm_kubernetes_cluster" "az-eus-aks-cluster" {
  name                = "az-eus-aks-cluster"
  location            = "${azurerm_resource_group.az-eus-rsg-kub.location}"
  resource_group_name = "${azurerm_resource_group.az-eus-rsg-kub.name}"

  #kubernetes_version = "1.8.11"
  kubernetes_version = "1.11.9"
  # kubernetes_version = "1.8.15"
  dns_prefix         = "kubcompany"
  linux_profile {
    admin_username = "mutley"

    ssh_key {
      key_data = "ssh-rsa some-ssh-key"
    }
  }
  agent_pool_profile {
    name  = "kubenode"
    count = 2

    vm_size = "Standard_F4s_v2" # 4vCPU, 8GB RAM, 16GB, 12.800 iops

    # vm_size = "Standard_DS2_v2" # 2vCPU, 7GB RAM, 100GB - Default Standard_DS1_v2
    # vm_size = "Standard_DS1_v2" # 2vCPU, 7GB RAM, 100GB - Default Standard_DS1_v2
    os_type = "Linux"

    os_disk_size_gb = 30
  }
  service_principal {
    client_id       = "http://your-appid-here"                  # appId
    client_secret   = "your-passaword-here"   # password
  }
  tags {
    Environment = "Development"
  }
}
