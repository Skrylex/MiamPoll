module PollsHelper

  def get_vote(id)
    JSON.parse(Net::HTTP.get(URI("https://maps.googleapis.com/maps/api/place/details/json?key=#{ENV['GOOGLE_API_SERVER_KEY']}&place_id=#{id}")))['result']
  end
end
