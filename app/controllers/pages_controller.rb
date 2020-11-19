# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @polls = Poll.where('closed_at > ? OR closed_at IS ?', Time.now, nil)
    @polls_closed = Poll.where('id IN (?) AND closed_at <= ?', current_account.votes.pluck(:poll_id), Time.now)
  end
end
