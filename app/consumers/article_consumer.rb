class ArticleConsumer < Racecar::Consumer
  subscribes_to "test"

  def process(message)
    puts "Received message: #{message.value}"
    ArticleProcessingJob.perform_later message.value
  end
end
