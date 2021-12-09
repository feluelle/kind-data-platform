resource "kubernetes_namespace" "dbt" {
  metadata {
    name = "dbt"
  }
}

resource "helm_release" "postgresql" {
  namespace  = kubernetes_namespace.dbt.metadata.0.name
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "10.13.8"
}

resource "kubernetes_cluster_role" "dbt" {
  metadata {
    name = "dbt"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "pods/log"]
    verbs      = ["create", "get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "dbt" {
  metadata {
    name = "dbt"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.dbt.metadata.0.name
  }
  subject {
    kind      = "ServiceAccount"
    namespace = kubernetes_namespace.airflow.metadata.0.name
    name      = "airflow-worker"
  }
}

data "kubernetes_secret" "postgresql" {
  metadata {
    name      = helm_release.postgresql.name
    namespace = kubernetes_namespace.dbt.metadata.0.name
  }
}
