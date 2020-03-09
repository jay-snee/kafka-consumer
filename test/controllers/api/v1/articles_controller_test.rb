require 'test_helper'

class Api::V1::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_articles_url
    assert_response :success
  end

  test "should respond to JSON" do
    get api_v1_articles_url, as: :json
    assert_response :success
  end

  test "should respond with 10 articles" do
    get api_v1_articles_url, as: :json
    payload = JSON.parse(response.body)
    assert_equal(10, payload.length)
  end

  test "should have multiple pages" do
    get api_v1_articles_url, as: :json
    page_1 = JSON.parse(response.body)

    get api_v1_articles_url(page: 2), as: :json
    page_2 = JSON.parse(response.body)

    assert_not_equal(page_1, page_2)
  end

  test "GET#show should return a single article" do
    article_id = articles.first.id
    get api_v1_article_url(id: articles.first.id), as: :json
    payload = JSON.parse(response.body)
    assert_equal(article_id, payload["id"])
  end
end
