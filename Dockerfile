FROM translized/cli:v0.10

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]