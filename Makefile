up:
	# mkdir -p /home/inception/data/mysql
	# mkdir -p /home/inception/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

PHONY: up down