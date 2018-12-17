#!/bin/bash
set -euo pipefail
cd ${0%/*}

docker stop grafana prometheus || true

docker run --rm -d \
  -p 9090:9090 \
  --name prometheus \
  --network dkrnet \
  -v $(pwd)/deployment/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus:v2.4.0

docker run --rm -d \
  -p 3000:3000 \
  --name grafana \
  --network dkrnet \
  grafana/grafana:5.2.4
