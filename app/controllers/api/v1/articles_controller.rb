# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ActionController::API

      # TODO: This method still doesn't keep track of initial
      # scroll position
      def index
        page = params[:page] || 1
        @articles = Article.order('created_at DESC').page(page).per(10)
        render json: @articles
      end

      def show
        @article = Article.find(params[:id])
        render json: @article
      end
    end
  end
end
