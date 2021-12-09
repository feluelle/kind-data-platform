resource "kubernetes_namespace" "superset" {
  metadata {
    name = "superset"
  }
}

resource "helm_release" "superset" {
  namespace  = kubernetes_namespace.superset.metadata.0.name
  name       = "superset"
  repository = "https://apache.github.io/superset"
  chart      = "superset"
  version    = "0.5.0"
  timeout    = 600

  # FIXME: When importing a data source we need to re-save the connection via UI for example by changing the protocol of postgresql to postgres.
  values = [
    <<EOT
extraConfigs:
  import_datasources.yaml: |
    databases:
      - database_name: dbt
        sqlalchemy_uri: postgresql://postgres:${data.kubernetes_secret.postgresql.data.postgresql-password}@postgresql.dbt.svc.cluster.local:5432/postgres
EOT
  ]
}
