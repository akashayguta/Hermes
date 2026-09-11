FROM nousresearch/hermes-agent:latest

USER root

COPY start.sh /start.sh

RUN sed -i 's/\r$//' /start.sh && \
    chmod +x /start.sh && \
    mkdir -p /opt/data && \
    chown -R hermes:hermes /opt/data /start.sh

ENV HERMES_HOME=/opt/data
ENV HOME=/home/hermes
ENV PYTHONUNBUFFERED=1

USER hermes

ENTRYPOINT ["/bin/sh", "/start.sh"]
