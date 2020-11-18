# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @polls = Poll.where('closed_at > ?', Time.now)
  end
end
