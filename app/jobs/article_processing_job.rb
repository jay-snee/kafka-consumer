# frozen_string_literal: true

# Article post processing job
class ArticleProcessingJob < ApplicationJob
  def perform(bnl_id)
    article = Article.where(bnl_id: bnl_id).first
    
    # Do some heavy lifting
  end
end
