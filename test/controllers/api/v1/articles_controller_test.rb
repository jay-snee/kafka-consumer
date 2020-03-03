require 'test_helper'

class Api::V1::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_articles_index_url
    assert_response :success
  end

  test "should respond to JSON" do
    get api_v1_articles_index_url, as: :json
    assert_response :success
  end

  test "should respond with 10 articles" do
    get api_v1_articles_index_url, as: :json
    payload = JSON.parse(response.body)
    assert_equal(10, payload.length)
  end
end
