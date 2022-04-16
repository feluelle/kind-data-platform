# CI

The Continuos Integration document describes everything you need to know when developing on this project.

## GitHub Actions

This project is using [GitHub Actions](https://github.com/features/actions) workflows in CI.

### docker

The [docker workflow](.github/workflows/docker.yml) validates the docker files across the repository.

### terraform

The [terraform workflow](.github/workflows/terraform.yml) validates the infrastructure code located in the [infra](infra) directory.

## Pre-commit

This project is using [pre-commit ci](https://pre-commit.ci) to run the pre-commit hooks defined in [.pre-commit-config.yaml](.pre-commit-config.yaml) in CI.

Optionall you can [install pre-commit](https://pre-commit.com/#install) locally and run:

```bash
pre-commit install
```

_This adds the pre-commit hooks to `.git/hooks` and runs every time you are about to commit changes._
