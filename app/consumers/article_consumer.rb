# frozen_string_literal: true

# Kafka consumer class.
class ArticleConsumer < Racecar::Consumer
  subscribes_to ENV['KAFKA_TOPIC']

  def process(message)
    message_data = JSON.parse message.value
    article = Article.create(message_data)
    ArticleProcessingJob.perform_later article.bnl_id
  end
end
