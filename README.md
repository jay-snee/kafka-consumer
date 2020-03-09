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
* A web pod to server the REST API
* A Sidekiq async background worker for post processing
* A Racecar Kafka consumer to recieve messages and add them to the async procesing pipeline
* A Producer which is a script in bin/ that continually loads 'articles' onto the Kafka queue

## Test
`rails test`
