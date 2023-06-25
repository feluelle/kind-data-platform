# DBT

## Deployment

You can deploy changes to the dbt image by running the following command:

```bash
task -t dbt/Taskfile.yml
```

_You can optionally tag the image with a version via `TAG=<version>`._

## Notes

The project has been initialized already through running the following command:

```bash
docker run --rm -it -v $PWD/dbt:/opt/dbt k3d-data-platform-dbt init
```
