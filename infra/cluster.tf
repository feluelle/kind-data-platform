resource "kind_cluster" "default" {
  name       = "kind-data-platform"
  node_image = "kindest/node:v1.22.4"
}
