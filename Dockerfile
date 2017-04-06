FROM jbonachera/arch
ENV VERSION=3.1.1-1470047149
RUN mkdir /opt/grafana && \
    curl -sL https://grafanarel.s3.amazonaws.com/builds/grafana-${VERSION}.linux-x64.tar.gz | tar -xf - -z --strip=1 -C /opt/grafana && \
    mkdir /var/lib/grafana && \
    useradd -r grafana -d /var/lib/grafana && \
    chown -R grafana: /var/lib/grafana
VOLUME /var/lib/grafana
COPY custom.ini /opt/grafana/conf/custom.ini
USER grafana
EXPOSE 8086
WORKDIR /opt/grafana
CMD /opt/grafana/bin/grafana-server
