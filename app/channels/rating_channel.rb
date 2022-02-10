class RatingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rating"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
