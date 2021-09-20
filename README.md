# Moar! (API)

## Prerequisites

- [Docker.](https://docs.docker.com/get-docker/)
- [Docker Compose.](https://docs.docker.com/compose/install/)

## Getting Started

1. See [prerequisites](#prerequisites).
2. At the root directory execute `docker-compose run api db:create` to create the databases.
3. At the root directory execute `docker-compose run api db:migrate`. to run the migrations.
4. At the root directory execute `docker-compose up -d` to run the project, which will be available on port [3000.](http://localhost:3000/)

> To stop the project run `docker-compose down`.

## Documentation

To see the endpoints of the API check the [Postman documentation.](https://documenter.getpostman.com/view/6180815/UUxtGBjX)

## Others

- [Web client for Moar.](https://github.com/LinkSake/moar-app)
- [Meaning of the emojis on the commits.](https://github.com/carloscuesta/gitmoji)
