FROM nousresearch/hermes-agent:latest

USER root

ENV HOME=/data
ENV HERMES_HOME=/data/.hermes

RUN mkdir -p /data/.hermes \
    && chown -R hermes:hermes /data

COPY start.sh /start.sh

RUN sed -i 's/\r$//' /start.sh \
    && chmod +x /start.sh \
    && chown hermes:hermes /start.sh

USER hermes

ENTRYPOINT ["/start.sh"]
