class ArticleConsumer < Racecar::Consumer
  subscribes_to "test"

  def process(message)
    puts "Received message: #{message.value}"
  end
end
