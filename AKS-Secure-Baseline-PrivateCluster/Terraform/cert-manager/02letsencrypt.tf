
resource "azurerm_role_assignment" "dns_contributor2" {
  scope                            = ""
  role_definition_name             = "DNS Zone Contributor"
  principal_id                     = ""
  skip_service_principal_aad_check = true # Allows skipping propagation of identity to ensure assignment succeeds.
}


resource "kubernetes_manifest" "letsencrypt_issuer_staging" {
  manifest = yamldecode(templatefile(
    "${path.module}/letsencrypt-issuer.tpl.yaml",
    {
      "name"                      = "letsencrypt-prod"
      "email"                     = "sonalikaroy@microsoft.com"
      "server"                    = "https://acme-v02.api.letsencrypt.org/directory"
      }
  ))

  depends_on = [helm_release.cert_manager]
}