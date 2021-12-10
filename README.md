# kind-data-platform

> A kind data platform on your local machine. 🤗

The objective of this project is to be able to quickly setup a data platform on your local machine via kind. It should also help you get familiar with production-ready setup and tools such as terraform, kubernetes and helm.

## Architecture

The following diagram shows the services currently being used, all running in a kind cluster:

![architecture](diagrams/kind-data-platform.png)

## Get started

### Prerequisites

Install the following tools:
- [docker](https://www.docker.com/)
- [kind](https://kind.sigs.k8s.io/)
- [helm](https://helm.sh/)
- [task](https://taskfile.dev/)
- [terraform](https://www.terraform.io/)

## Roadmap

- [ ] Use [localstack](https://docs.localstack.cloud/integrations/terraform/)
  - [ ] _Amazon S3_ as data lake
  - [ ] _Amazon Redshift_ as data warehouse instead of postgres
  - [ ] _AWS Secrets Manager_ as storage for Airflow Connections & Airflow Variables
- [x] Add [Airbyte](https://airbyte.io) Helm chart for data loading
  - [x] Implement an example Airflow DAG
