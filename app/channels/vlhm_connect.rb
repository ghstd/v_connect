class VlhmConnect < ApplicationCable::Channel
  def subscribed
    stream_from "vlhm_connect"
  end

  def unsubscribed
  end

  def signal_message(data)
    message = data['message']
    sender_id = data['client_id']
    ActionCable.server.broadcast('vlhm_connect', {type: 'signal_message', message: message, sender_id: sender_id})
  end

  def text_message(data)
    message = data['message']
    sender_id = data['client_id']
    ActionCable.server.broadcast('vlhm_connect', {type: 'text_message', message: message, sender_id: sender_id})
  end
end
