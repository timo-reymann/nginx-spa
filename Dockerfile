FROM nginx:1.23.3-alpine

WORKDIR /app
RUN addgroup -g 1002 app && \
    adduser -D -u 1002 -G app app && \
    chown -R app:app /app

# Copy configuration
COPY nginx.conf /etc/nginx/nginx.conf

USER app

# Run it!
ENTRYPOINT ["nginx"]
