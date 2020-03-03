# frozen_string_literal: true

# Article post processing job
class ArticleGeneratingJob < ApplicationJob
  def perform(*args)
    logger.info "Running job - #{args}"
  end
end
