module Api
  module V1
    class ArticlesController < ActionController::API
      def index
        page = params[:page] || 1
        @articles = Article.order('created_at DESC').page(page).per(10)
        render json: @articles
      end
    end
  end
end
