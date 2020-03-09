# frozen_string_literal: true

class Article < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[title summary data]
  before_create :set_title, :set_summary

  def set_title
    self.title ||= data.find { |h| h['hl1'] } ['hl1']
  end

  def set_summary
    self.summary ||= data.find { |h| h['para'] } ['para']
  end
end
