module Api
  module V1
    class ScenariosController < ActionController::API
      def index
        per_page = params[:per_page] || 10
        @per_page_count = per_page
        page = params[:page] || 1
        if params[:search]
          @scenarios = Scenario.algolia_search(params[:search]).page(page).per(per_page)
        else
          @scenarios = Scenario.page(page).per(per_page)
        end
        render json: @scenarios
      end
    end
  end
end
