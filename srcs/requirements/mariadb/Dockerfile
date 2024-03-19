FROM debian:bullseye

# Update packages and install MariaDB
RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y mariadb-server

# Copy configuration script into container and give it execute permissions
COPY ./tools/mariadb.sh /
RUN chmod +x /mariadb.sh

# Initialize the MariaDB data directory and creates the system tables in the mysql database
RUN mysql_install_db

# Make container listen on port 3306
EXPOSE 3306

# Execute script
ENTRYPOINT ["/mariadb.sh"]

# Recomended way to start MariaDB
CMD ["mysqld_safe", "--bind-address=0.0.0.0"]