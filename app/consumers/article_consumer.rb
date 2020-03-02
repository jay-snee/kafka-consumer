class ArticleConsumer < Racecar::Consumer
  subscribes_to "test"

  def process(message)
    logger.info "Received message: #{message.value}"
    ArticleProcessingJob.perform_later message.value
  end
end
