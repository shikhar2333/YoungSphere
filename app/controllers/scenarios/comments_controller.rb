class Scenarios::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Scenario.find(params[:scenario_id])
  end
end