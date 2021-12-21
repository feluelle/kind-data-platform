FROM fishtownanalytics/dbt:1.0.0

ENV DBT_PROFILES_DIR=/opt/dbt

WORKDIR ${DBT_PROFILES_DIR}

COPY . .

RUN dbt deps
