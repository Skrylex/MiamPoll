module PollsHelper

  def get_vote(id)
    JSON.parse(Net::HTTP.get(URI("https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyDh2FRAWRvcJQ0OCnU4SsSuuGJQZ-qHFgo&place_id=#{id}")))['result']
  end
end
