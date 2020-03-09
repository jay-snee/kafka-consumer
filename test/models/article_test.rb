# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'it has a title' do
    article_attr = articles.first.attributes.except!(
      'id',
      'created_at',
      'updated_at'
    )

    article = Article.create(article_attr)
    assert_equal 'This is my title 1', article.title
  end

  test 'it has a summary' do
    article_attr = articles.first.attributes.except!(
      'id',
      'created_at',
      'updated_at'
    )

    article = Article.create(article_attr)
    assert_equal 'this is a first paragraph 1', article.summary
  end
end
