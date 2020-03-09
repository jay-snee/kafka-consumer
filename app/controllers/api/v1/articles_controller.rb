# frozen_string_literal: true

module Api
  module V1
    # Client REST API controller
    class ArticlesController < ActionController::API
      # TODO: This method doesn't keep track of initial
      # scroll position.
      def index
        page = params[:page] || 1
        @articles = Article.order('created_at DESC').page(page).per(10)
        render json: @articles
      end

      def show
        @article = Article.where(bnl_id: params[:id]).first
        render json: @article
      end

      def search
        @articles = []
        search_results = PgSearch.multisearch(params[:search])
        search_results.each do |article|
          @articles << article.searchable
        end
        render json: @articles
      end
    end
  end
end
