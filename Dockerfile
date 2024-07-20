FROM prom/prometheus:latest as Prometheus
COPY prometheus.yaml /etc/prometheus/prometheus.yml
