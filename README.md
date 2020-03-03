# README

## Depedencies

* Redis
* Kafka

## Install

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

## Test
`rails test`

## Install & start Kafka
* `brew cask install homebrew/cask-versions/adoptopenjdk8`
* `brew install kafka`
* `zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties & kafka-server-start /usr/local/etc/kafka/server.properties`
