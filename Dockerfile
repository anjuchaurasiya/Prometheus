FROM debian:10

ENV PROM_VERSION 2.26.0

RUN set -x \
# create prom user/group 
    && addgroup --system --gid 101 prom \
    && adduser --system --disabled-login --ingroup prom --no-create-home --home /nonexistent --gecos "prom user" --shell /bin/false --uid 101 prom \
    && apt-get update -y\
    && apt-get install wget -y\
    && wget "https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz" \
    && tar -xzf prometheus-2.26.0.linux-amd64.tar.gz \
    && cd prometheus-2.26.0.linux-amd64
WORKDIR ./prometheus-2.26.0.linux-amd64/   
ENTRYPOINT ["./prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
EXPOSE 9090

LABEL maintainer="Anju Chaurasiya"
