# Deployment

First create the infrastructure by running the following command:
```bash
task -t infra/Taskfile.yml
```
_See [infra](infra/README.md) for more information about the projects infrastructure._

You can deploy changes to the airflow image by running the following command:
```bash
task -t airflow/Taskfile.yml
```
_You can optionally tag the image with a version via TAG=<version>_




```bash
docker run --rm -v (pwd)/dbt:/opt/dbt -w /opt/dbt fishtownanalytics/dbt:0.21.0 init project
```



You can deploy changes to the dbt image by running the following command:
```bash
task -t dbt/Taskfile.yml
```
_You can optionally tag the image with a version via TAG=<version>_

To retrieve the password for the grafana user `admin`, run the following:
```bash
kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```