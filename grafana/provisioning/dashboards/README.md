
To fix the unknown variable `${DS_THEMIS}` error, run the following command:
```bash
sed -i "" 's/${DS_THEMIS}/Prometheus/g' grafana/provisioning/dashboards/prometheus-2-0-overview_rev2.json
```
_See https://github.com/grafana/grafana/issues/10786 for more information on this kind of issues._
