class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update close open]

  before_action only: %i[close open] do
    raise ActionController::RoutingError.new("Polls : Need poll's owner to change state") unless @poll.owner?(current_account)
  end

  def index
    @polls = {
      opened: current_account.open_polls,
      closed: current_account.close_polls
    }
  end

  def show
    @my_vote = current_account.votes.find_by(poll_id: @poll.id) || Vote.new()
  end

  def new
    @poll = Poll.new()
  end

  def create
    @poll = Poll.new(params_poll)
    @poll.account_id = current_account.id

    return redirect_to polls_path if @poll.save

    @poll.choices = ""
    render :new
  end

  def open
    @poll.update(closed_at: nil)
    redirect_to poll_path(@poll.id)
  end

  def close
    @poll.update(closed_at: Time.now)
    redirect_to poll_path(@poll.id)
  end

  private

  def set_poll 
    @poll = Poll.find(params[:id])
  end

  def params_poll
    params.require(:poll).permit(:title, :description, :choices)
  end
end
