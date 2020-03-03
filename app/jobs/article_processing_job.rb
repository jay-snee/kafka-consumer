# frozen_string_literal: true

# Article post processing job
class ArticleProcessingJob < ApplicationJob
  def perform(article_data)
    attributes = JSON.parse(article_data)
    Article.create(attributes)
  end
end
