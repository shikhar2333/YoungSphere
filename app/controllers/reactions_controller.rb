class ReactionsController < ApplicationController
  before_action :find_scenario
  def create
    reaction =  @scenario.reactions.find_or_initialize_by(verb: 'like', user_id: current_user.id)
    reaction.persisted? ? reaction.destroy : reaction.save
    redirect_to scenario_path(@scenario)
  end
  private
  def find_scenario
    @scenario = Scenario.find(params[:scenario_id])
  end
end