web: bundle exec puma -C config/puma.rb
consumer: bundle exec racecar ArticleConsumer
worker: bundle exec sidekiq -C ./config/worker.yml -v