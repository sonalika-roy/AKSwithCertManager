output "aks_id" {
  value = "${module.aks.aks_id}"
}

output "node_pool_rg" {
  value = "${module.aks.node_pool_rg}"
}

# Managed Identities created for Addons

output "kubelet_id" {
  value = "${module.aks.kubelet_id}"
}

output "agic_id" {
  value = "${module.aks.agic_id}"
}

output "kube_config" {
  value       = "${module.aks.kube_config}"
  description = "kubeconfig for kubectl access."
}
