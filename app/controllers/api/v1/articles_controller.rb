module Api
  module V1
    class ArticlesController < ActionController::API
      def index
        @articles = Article.last(10)
        render json: @articles
      end
    end
  end
end
