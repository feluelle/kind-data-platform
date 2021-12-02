FROM fishtownanalytics/dbt:0.21.0

ENV DBT_PROFILES_DIR=/opt/dbt

WORKDIR ${DBT_PROFILES_DIR}

COPY . .

RUN dbt deps
