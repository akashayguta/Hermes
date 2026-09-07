FROM nousresearch/hermes-agent:latest

USER root

COPY start.sh /start.sh

# Convert CRLF → LF and make the script executable
RUN sed -i 's/\r$//' /start.sh && \
    chmod +x /start.sh

USER hermes

ENTRYPOINT ["/bin/sh", "/start.sh"]
