module Api
  module V1
    class ScenariosController < ActionController::API
      before_action :set_scenario, only: [:show, :edit, :update, :destroy]
      #before_action :authenticate_user!
      def index
        per_page = params[:per_page] || 10
        @per_page_count = per_page
        page = params[:page] || 1
        if params[:search]
          @scenarios = Scenario.algolia_search(params[:search]).page(page).per(per_page)
        else
          @scenarios = Scenario.page(page).per(per_page)
        end
        render json: ScenarioSerializer.new(@scenarios).serializable_hash
      end

      def show
        params = {current_user_id: current_user.present? ? current_user.id : nil}
        render json: ShowScenarioSerializer.new(@scenario, {params: params , include: [:comments]}).serializable_hash
      end

      private
      def set_scenario
        @scenario = Scenario.find(params[:id])
      end
    end
  end
end
