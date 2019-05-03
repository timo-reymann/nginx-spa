FROM nginx:latest
# Copy configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
# We dont want the container to immediately terminate
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Make app directory
RUN mkdir /app

# Run it!
CMD ["nginx"]
