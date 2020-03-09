# frozen_string_literal: true

class Article < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[title summary body]
  before_create :set_title, :set_summary

  def set_title
    self.title ||= body.find { |h| h['type'] == 'hl1' }['content']
  end

  def set_summary
    self.summary ||= body.find { |h| h['type'] == 'para' }['content']
  end
end
