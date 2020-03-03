require 'test_helper'

class ArticleProcessingJobTest < ActiveSupport::TestCase
  test "it should create an Article object" do
    attributes = articles(:one).attributes.except("id", "created_at", "updated_at")
    ArticleProcessingJob.perform_now(attributes.to_json)
    assert Article.all.count == 3
  end
end