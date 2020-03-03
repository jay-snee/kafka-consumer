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

  test "should have multiple pages" do
    get api_v1_articles_index_url, as: :json
    page_1 = JSON.parse(response.body)

    get api_v1_articles_index_url(page: 2), as: :json
    page_2 = JSON.parse(response.body)

    assert_not_equal(page_1, page_2)
  end
end
