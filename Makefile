# This is an easily customizable makefile template. The purpose is to
# provide an instant building environment for docker.
#
# Docker:
# ------
# $ make build               - build docker build
# $ make up               	 - start docker containers
# $ make down                - stop docker containers
# $ make login               - log in php-fpm APP container

##==========================================================================
## Variables
##==========================================================================
include ./.env
export
##==========================================================================
DOCKER_EXEC_PHP_FPM = docker exec -it --user=www-data ${APP_ENV}.${APP_NAME}.mosquitto

##==========================================================================
## make bootstrap
##==========================================================================
build:
	docker network create ${NETWORK} || true && \
    docker compose build --no-cache

##==========================================================================
## make up
##==========================================================================
up:
	docker compose up --build -d
##==========================================================================
## make down
##==========================================================================
down:
	docker compose down -v

##==========================================================================
## make docker-login
##==========================================================================
login:
	$(DOCKER_EXEC_PHP_FPM) bash