# Deployment

First create the infrastructure by running the following command:
```bash
task -t infra/Taskfile.yml setup
```
_See [infra](infra/README.md) for more information about the projects infrastructure._

## airflow

You can deploy changes to the airflow image by running the following command:
```bash
task -t airflow/Taskfile.yml
```
_You can optionally tag the image with a version via TAG=<version>_

### Notes

For the Airbyte DAG you need to create an Airflow variable called `AIRBYTE_GITHUB_TO_POSTGRES_CONNECTION_ID`. For adding Airflow Variables follow [this guide](https://airflow.apache.org/docs/apache-airflow/stable/howto/variable.html).

## dbt

You can deploy changes to the dbt image by running the following command:
```bash
task -t dbt/Taskfile.yml
```
_You can optionally tag the image with a version via TAG=<version>_

## Notes

I tested the deployment with 10 CPU and 16 GB RAM. If you give the docker daemon less resources, make sure to adjust the `timeout` parameter in the helm releases as creating them can take up more time.
