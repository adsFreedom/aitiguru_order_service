FROM postgres:15-alpine

COPY db/sql/ /init_source/

COPY docker/postgres/init.sh /tmp/docker-entrypoint-init.sh
RUN chmod +x /tmp/docker-entrypoint-init.sh

ENTRYPOINT ["/tmp/docker-entrypoint-init.sh"]

CMD ["postgres"]