FROM debian:bullseye

# Update packages and install WordPress recomended resources
RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y wget curl unzip php7.4 \
    php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd \
    php7.4-xml php7.4-mbstring

# Install WordPress Command Line Interface(CLI)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Create directory for PHP-FPM socket
RUN mkdir /run/php/ && chmod 755 /run/php/

# Configure PHP-FPM to listen on port 9000
RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

# Copy script into container
COPY ./tools/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh

# Make container listen on port 9000
EXPOSE 9000

# Execute script
ENTRYPOINT ["/tmp/wordpress.sh"]