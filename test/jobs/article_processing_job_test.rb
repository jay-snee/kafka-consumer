require 'test_helper'

class ArticleProcessingJobTest < ActiveSupport::TestCase
  test "it should create an Article object" do
    ArticleProcessingJob.perform_later(articles(:article))
    assert Article.all.count == 1
  end
end