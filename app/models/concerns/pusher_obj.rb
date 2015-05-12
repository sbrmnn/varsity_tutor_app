module PusherObj
  extend ActiveSupport::Concern

  private

  def push(message)
    if message.present?
      Pusher['purchase_channel'].trigger('my_event', {
        message: message
      })
    end
  end
end
