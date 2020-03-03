require 'test_helper'

class ArticleProcessingJobTest < ActiveSupport::TestCase
  test "it should create an Article object" do
    count = Article.count
    attributes = articles(:one).attributes.except("id", "created_at", "updated_at")
    ArticleProcessingJob.perform_now(attributes.to_json)
    assert_equal Article.count, (count += 1)
  end
end