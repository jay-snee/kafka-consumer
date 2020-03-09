# frozen_string_literal: true

# Kafka consumer class.
class ArticleConsumer < Racecar::Consumer
  subscribes_to 'articles-test'

  def process(message)
    article = Article.create(message.value)
    ArticleProcessingJob.perform_later article.bnl_id
  end
end
