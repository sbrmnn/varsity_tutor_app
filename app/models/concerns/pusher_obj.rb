module PusherObj
  extend ActiveSupport::Concern

  private

  def push(channel, message)
    if message.present?
      Pusher[channel].trigger('my_event', {
        message: message
      })
    end
  end
end
