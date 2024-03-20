#!/bin/bash

cd /var/www/html

# Check if WordPress is already configured
if [ ! -e "/var/www/html/wp-config.php" ]; then
	wp cli update --yes --allow-root
	wp core download --allow-root
	wp config create --dbname=${DB_NAME} --path=/var/www/html/ --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --allow-root
	wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
	wp user create "${WP_USER}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PASS}" --role=author --display_name="${DB_USER}" --allow-root
else
	echo "installed"

fi

# Always activate the desired theme
THEME="astra"  # Change this to your desired theme
if ! wp theme is-installed $THEME --allow-root; then
    wp theme install $THEME --activate --allow-root
else
    wp theme activate $THEME --allow-root
fi

echo "Starting WordPress fastCGI on port 9000."

exec /usr/sbin/php-fpm7.4 -F -R
