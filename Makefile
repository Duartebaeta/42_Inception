up:
	#mkdir -p /home/inception/data/mysql
	#mkdir -p /home/inception/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

restart:
	docker-compose -f srcs/docker-compose.yml restart

clean:
	sudo rm -rf data/wordpress/*
	sudo rm -rf data/mysql/*
PHONY: up down restart
