# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ArticlesControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_articles_url
        assert_response :success
      end

      test 'should respond to JSON' do
        get api_v1_articles_url, as: :json
        assert_response :success
      end

      test 'should respond with 10 articles' do
        get api_v1_articles_url, as: :json
        payload = JSON.parse(response.body)
        assert_equal(10, payload.length)
      end

      test 'should have multiple pages' do
        get api_v1_articles_url, as: :json
        page1 = JSON.parse(response.body)

        get api_v1_articles_url(page: 2), as: :json
        page2 = JSON.parse(response.body)

        assert_not_equal(page1, page2)
      end

      test 'GET#show should return a single article' do
        article_id = articles.first.bnl_id
        get api_v1_article_url(id: articles.first.bnl_id), as: :json
        payload = JSON.parse(response.body)
        assert_equal(article_id, payload['bnl_id'])
      end

      test 'GET#search returns empty array with missing search param' do
        get search_api_v1_articles_url, as: :json
        payload = JSON.parse(response.body)
        assert_equal([], payload)
      end

      test 'GET#search returns empty array with blank search param' do
        get search_api_v1_articles_url(search: ''), as: :json
        payload = JSON.parse(response.body)
        assert_equal([], payload)
      end

      test 'GET#search returns results array with search param' do
        count = 26
        generate_articles(count, 'Bingo Bango')

        get search_api_v1_articles_url(search: 'Bingo'), as: :json
        payload = JSON.parse(response.body)
        assert_equal(count, payload.length)
        assert_equal(count + 1000, Article.count)
        assert_equal('Bingo Bango', payload.first['title'])
      end
    end
  end
end
