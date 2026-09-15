FROM nousresearch/hermes-agent:latest

USER root

ENV HOME=/data
ENV HERMES_HOME=/data/.hermes

# OpenCode Zen
ENV OPENCODE_BASE_URL=https://opencode.ai/zen/v1
ENV OPENCODE_MODEL=muse-spark-1.3-contributor-free

RUN mkdir -p /data/.hermes \
    && chown -R hermes:hermes /data

COPY start.sh /start.sh

RUN sed -i 's/\r$//' /start.sh \
    && chmod +x /start.sh \
    && chown hermes:hermes /start.sh

USER hermes

ENTRYPOINT ["/bin/sh", "/start.sh"]
