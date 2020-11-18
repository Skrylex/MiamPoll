# frozen_string_literal: true

class PollsReflex < ApplicationReflex
  
  def searchPlaces
    p "=== SEARCH ==="

    net = Net::HTTP.get(URI("https://maps.googleapis.com/maps/api/place/textsearch/json?key=#{ENV['GOOGLE_API_SERVER_KEY']}&input=#{params[:search_places].to_s}&inputtype=textquery&radius=10000&types=restaurant|bar|food"))

    morph "#gmap-api-container", ApplicationController.render(partial: "layouts/gmap", locals: { results: JSON.parse(net)['results'] })
  end
end
