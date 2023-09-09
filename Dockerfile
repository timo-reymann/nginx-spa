FROM ubuntu:latest as build
RUN apt-get update && \
    apt-get install -y wget build-essential
RUN apt-get install -y libxslt1-dev libxml2-dev zlib1g-dev libpcre3-dev libbz2-dev libssl-dev
# renovate: datasource=github-tags depName=nginx/nginx
ARG nginx_version=1.25.2
# renovate: datasource=github-tags depName=openssl/openssl versioning=docker
ARG openssl_version=3.1.2
RUN wget http://nginx.org/download/nginx-${nginx_version}.tar.gz && \
    tar xf nginx-${nginx_version}.tar.gz
WORKDIR nginx-${nginx_version}
RUN wget http://www.openssl.org/source/openssl-${openssl_version}.tar.gz && \
    tar xf openssl-${openssl_version}.tar.gz
RUN ./configure --prefix=/opt/nginx \
                --with-cc-opt="-static -static-libgcc" \
                --with-ld-opt="-static" \
                --with-cpu-opt=generic \
                --with-pcre \
                --with-ipv6 \
                --with-poll_module \
                --with-select_module \
                --with-poll_module \
                --with-http_ssl_module \
                --with-http_realip_module \
                --with-http_flv_module \
                --with-http_mp4_module \
                --with-http_gunzip_module \
                --with-http_gzip_static_module \
                --with-http_secure_link_module \
                --with-openssl=./openssl-${openssl_version}
RUN make -j1
RUN make -j1 install
COPY ./nginx.conf /opt/nginx/conf/nginx.conf
COPY ./nginx_html /opt/nginx/html
RUN chown -R 65532:65532 /opt/nginx
FROM scratch
COPY --from=gcr.io/distroless/static-debian12:nonroot / /
COPY --from=build /opt/nginx /opt/nginx
USER nonroot
ENTRYPOINT ["/opt/nginx/sbin/nginx"]
