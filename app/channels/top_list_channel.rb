# frozen_string_literal: true

class TopListChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'top_list'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
