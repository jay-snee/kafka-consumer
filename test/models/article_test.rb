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
    10.times do |i|
      Article.create(data: [
        {"hl1": "Bingo Bango"},
        {"para": Faker::Lorem.paragraph},
        {"para": Faker::Lorem.paragraph},
        {"para": Faker::Lorem.paragraph}
      ])
    end
    search_results = PgSearch.multisearch('Bingo Bango')
    assert_equal(10, search_results.count)
    assert_equal(1010, Article.count)
  end

  test 'it has a searchable summary' do
    para_content = Faker::Lorem.paragraph
    10.times do |i|
      Article.create(data: [
        {"hl1": "Bingo Bango"},
        {"para": para_content},
        {"para": para_content},
        {"para": para_content}
      ])
    end
    search_results = PgSearch.multisearch(para_content)
    assert_equal(10, search_results.count)
    assert_equal(1010, Article.count)
  end
end
