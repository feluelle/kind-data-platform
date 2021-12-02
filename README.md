# kind-data-platform

> A kind data platform on your local machine. 🤗

## Get started

### Prerequisites

Install the following tools:
- [docker](https://www.docker.com/)
- [kind](https://kind.sigs.k8s.io/)
- [task](https://taskfile.dev/)
- [terraform](https://www.terraform.io/)

## Roadmap

- [ ] Use [localstack](https://docs.localstack.cloud/integrations/terraform/)
  - [ ] _Amazon S3_ as data lake
  - [ ] _Amazon Redshift_ as data warehouse instead of postgres
  - [ ] _AWS Secrets Manager_ as storage for Airflow Connections & Airflow Variables
  - [ ] _Amazon ECR_ as Storage for docker images instead of loading directly to nodes i.e. `kind load image`
- [ ] Add [Airbyte](https://airbyte.io) Helm chart for data loading
  - [ ] Implement some example extract and load to the data warehouse or postgres
- [ ] Add documentation about `infra`
  - [ ] Add diagram (via [Excalidraw](https://excalidraw.com))
- [ ] Add documentation about deployment
- [ ] Scrape every infra service via _Prometheus_
- [ ] Add _Grafana_ dashboard for every infra service
- [ ] Add contributing guidelines
