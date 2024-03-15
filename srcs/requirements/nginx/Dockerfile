FROM debian:bullseye

# Update packages and install Nginx
RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y nginx curl

# Create necessary directories for Nginx to run correctly
RUN mkdir -p /var/www/ /etc/nginx/ssl/ /run/nginx

# Install mkcert tool, for automatic SSL/TLS certificate creation
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
	chmod +x mkcert-v*-linux-amd64 && \
	cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

# Run mkcert tool
RUN mkcert dhomem-d.42.fr && cp dhomem-d.42.fr* /etc/nginx/ssl/

# Copy Nginx config into container
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Make container listen on port 443
EXPOSE 443

# Execute Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]