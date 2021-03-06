class MatchesController < ApplicationController
  def index
    @matches = Match.where(user_id: current_user)
  end

  def create
    @match = Match.new
    request = Request.find(params["request_id"])
    @match.user = current_user
    @match.request = request
    if @match.save
      redirect_to request_matches_path(@match)
    else
      redirect_to request_path(@match.request)
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to request_matches_path(@match.request)
  end
end
