# frozen_string_literal: true

# Article post processing job
class ArticleProcessingJob < ApplicationJob
  def perform(*args)
    logger.info "Running job - #{args}"
  end
end
