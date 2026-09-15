FROM nousresearch/hermes-agent:latest

USER root

ENV HOME=/data
ENV HERMES_HOME=/data/.hermes

RUN mkdir -p /data/.hermes

COPY start.sh /start.sh

RUN sed -i 's/\r$//' /start.sh \
    && chmod +x /start.sh

ENTRYPOINT ["/bin/sh", "/start.sh"]
