resource "kubernetes_namespace" "grafana" {
  metadata {
    name = "grafana"
  }
}

resource "helm_release" "grafana" {
  namespace     = kubernetes_namespace.grafana.metadata.0.name
  name          = "grafana"
  repository    = "https://grafana.github.io/helm-charts"
  chart         = "grafana"
  version       = "6.17.8"

  set {
    name  = "sidecar.dashboards.enabled"
    value = "true"
  }
  set {
    name  = "sidecar.datasources.enabled"
    value = "true"
  }
}

resource "kubernetes_config_map" "prometheus_dashboard" {
  metadata {
    namespace = kubernetes_namespace.grafana.metadata.0.name
    name      = "prometheus-dashboard"

    labels = {
      "grafana_dashboard" = "1"
    }
  }

  data = {
    "prometheus_dashboard.json" = file("/Users/felixuellendall/Projects/kind-data-platform/grafana/provisioning/dashboards/prometheus-2-0-overview_rev2.json")
  }
}

resource "kubernetes_secret" "prometheus_datasource" {
  metadata {
    namespace = kubernetes_namespace.grafana.metadata.0.name
    name      = "prometheus-datasource"

    labels = {
      "grafana_datasource" = "1"
    }
  }

  data = {
    "datasource.yaml" = file("/Users/felixuellendall/Projects/kind-data-platform/grafana/provisioning/datasources/datasources.yaml")
  }
}
