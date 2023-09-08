FROM nginx:1.25.2-alpine as system

WORKDIR /app
RUN addgroup -g 1002 app && \
    adduser -D -u 1002 -G app app && \
    chown -R app:app /app

# Strip system
RUN rm -rf /bin \
    /docker-entrypoint* \
    /*/apk \
    /etc/fonts \
    /sbin \
    /usr/bin \
    /usr/lib/*X11* \
    /usr/share/X11 \
    /usr/lib/libdav1d* \
    /usr/lib/libfont* \
    /usr/lib/libxcb* \
    /usr/share/fontconfig \
    /usr/share/apk

# Copy configuration
COPY nginx.conf /etc/nginx/nginx.conf

FROM scratch
COPY --from=system / /
USER app

# Run it!
ENTRYPOINT ["nginx"]
