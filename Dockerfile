FROM jbonachera/arch
ENV VERSION=4.2.0
RUN mkdir /opt/grafana && \
    curl -sL https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${VERSION}.linux-x64.tar.gz | tar -xf - -z --strip=1 -C /opt/grafana && \
    mkdir /var/lib/grafana && \
    useradd -r grafana -d /var/lib/grafana && \
    chown -R grafana: /var/lib/grafana
VOLUME /var/lib/grafana
COPY custom.ini /opt/grafana/conf/custom.ini
USER grafana
EXPOSE 3000
WORKDIR /opt/grafana
CMD /opt/grafana/bin/grafana-server
