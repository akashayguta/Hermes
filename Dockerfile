
FROM nousresearch/hermes-agent:latest

USER root

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER hermes

ENTRYPOINT ["/start.sh"]
