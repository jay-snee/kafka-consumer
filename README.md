# README

## Depedencies

* Redis
* Kafka

## Installation

### Dependencies
* `brew cask install homebrew/cask-versions/adoptopenjdk8`
* `brew install kafka`
* `zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties & kafka-server-start /usr/local/etc/kafka/server.properties`
* `brew install redis`
* `redis-server`
* `gem install foreman`

### Application
`bundle install`

## Run
`foreman start`

The application will immediatly spawn four processes: 
* A web pod to serve the REST API
* A Sidekiq async background worker for post processing
* A Racecar Kafka consumer to recieve messages and add them to the async procesing pipeline
* A Producer which is a script in bin/ that continually loads 'articles' onto the Kafka queue

Sidekiq UI can be viewed here - http://localhost:5000/sidekiq/

These processes are designed to be deployed in highly scalable formations via (buildpack)[https://www.buildpacks.io] based (OCI format containers)[https://github.com/opencontainers/image-spec] on single node platforms such as (Dokku)[http://dokku.viewdocs.io/dokku/] or larger Kubernetes based platforms such as (Hephy/Deis)[https://github.com/teamhephy/workflow] in a (12Factor)[https://12factor.net] compliant architecture.

## Test
`rails test`

## Required Environment Variables

* `DATABASE_URL=postgresql://user:pass@localhost:5432/kafka-consumer-dev`
* `TEST_DATABASE_URL=postgresql://user:pass@localhost:5432/kafka-consumer-test`
* `KAFKA_TOPIC=articles-test`
* `KAFKA_BROKER=localhost:9092`
* `KAFKA_CLIENT_ID=kafka_consumer`
