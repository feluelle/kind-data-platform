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

- [ ] Use dbt namespace for dbt tasks and postgres db
- [ ] Use [localstack](https://docs.localstack.cloud/integrations/terraform/)
  - [ ] S3 as data lake
  - [ ] Amazon Redshift as data warehouse instead of postgres
  - [ ] AWS Secrets Manager as storage for Airflow Connections
  - [ ] ECR as Storage for docker images instead of loading directly to nodes i.e. `kind load image`
