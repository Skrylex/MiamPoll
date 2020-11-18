class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update destroy]

  def index
    @polls = {
      opened: current_account.open_polls,
      closed: current_account.close_polls
    }
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params_poll)
    @poll.account_id = current_account.id
    @poll.closed_at = Time.now.advance(minutes: 30)

    return redirect_to polls_path if @poll.save
    render :new
  end

  private

  def set_poll 
    @poll = Poll.find(params[:id])
  end

  def params_poll
    params.require(:poll).permit(:title, :description)
  end
end
