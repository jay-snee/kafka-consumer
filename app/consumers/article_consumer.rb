# frozen_string_literal: true

# Kafka consumer class.
class ArticleConsumer < Racecar::Consumer
  subscribes_to 'articles-test'

  def process(message)
    # It's probably a bad idea passing a variable
    # sized payload through as params to a Job
    # but I've left it as is for this trivial example
    # as otherwise there'd be nothing to do in the async job.

    ArticleProcessingJob.perform_later message.value
  end
end
