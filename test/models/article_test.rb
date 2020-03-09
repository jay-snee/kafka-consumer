# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article_attr = articles.first.attributes.except!(
      'id',
      'created_at',
      'updated_at'
    )
  end

  test 'it has a title' do
    article = Article.create(@article_attr)
    assert_equal 'This is my title 1', article.title
  end

  test 'it has a summary' do
    article = Article.create(@article_attr)
    assert_equal 'this is a first paragraph 1', article.summary
  end

  test 'it has a searchable title' do
    generate_articles(7, 'Bingo Bango')
    search_results = PgSearch.multisearch('Bingo Bango')
    assert_equal(7, search_results.count)
    assert_equal(1007, Article.count)
  end

  test 'it has a searchable summary' do
    para_content = Faker::Lorem.paragraph
    generate_articles(4, Faker::ChuckNorris.fact, para_content)
    search_results = PgSearch.multisearch(para_content)
    assert_equal(4, search_results.count)
    assert_equal(1004, Article.count)
  end
end
