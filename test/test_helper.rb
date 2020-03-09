# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def generate_articles(count = 10, title = Faker::ChuckNorris.fact, paragraph = Faker::Lorem.paragraph)
      count.times do
        Article.create(
          bnl_id: SecureRandom.uuid,
          published_at: (DateTime.now + rand(-10..10).days),
          body: [
            { "hl1": title },
            { "para": paragraph },
            { "para": paragraph },
            { "para": paragraph }
          ]
        )
      end
    end
  end
end
