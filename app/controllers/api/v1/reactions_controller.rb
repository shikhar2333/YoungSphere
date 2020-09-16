module Api
  module V1
    class ReactionsController < ActionController::API
      before_action :authenticate_user!
      before_action :find_scenario
      def create
        reaction =  @scenario.reactions.find_or_initialize_by(verb: params[:verb], user_id: current_user.id)
        reaction.persisted? ? reaction.destroy : reaction.save
        render json: reaction.persisted?
      end
      private
      def find_scenario
        @scenario = Scenario.find(params[:scenario_id])
      end
    end
  end
end