class VotesController < ApplicationController
  before_action :set_poll, only: %i[create update]
  before_action :set_vote, only: %i[update]

  before_action only: %i[create update] do 
    redirect_to poll_path(@poll.id) unless @poll.open?
  end

  def create
    @vote = Vote.new(params_vote)
    @vote.account_id = current_account.id
    @vote.save
    
    redirect_to poll_path(@vote.poll_id)
  end

  def update
    @vote.update(params_vote)
    redirect_to poll_path(@vote.poll_id)
  end

  private
  def set_poll
    @poll = Poll.find(params[:vote][:poll_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def params_vote
    params.require(:vote).permit(:poll_id, :gmap_id)
  end

end
