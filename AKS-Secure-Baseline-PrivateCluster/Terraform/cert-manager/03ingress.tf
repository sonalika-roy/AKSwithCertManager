resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  namespace        = "cert-manager"
  create_namespace = false
  repository  = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  
  set {
    name  = "rbac.create"
    value = "true"
  }
  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
  set {
    name  = "controller.replicaCount"
    value = "2"
  }
  set {
    name  = "controller.nodeSelector.kubernetes\\.io/os" 
    value = "linux"
  }
  set {
    name  = "defaultBackend.nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }
  set {
    name = "controller.admissionWebhooks.patch.nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }
  set {
      name= "controller.service.type"
      value= "LoadBalancer"
  } 
   
  
}