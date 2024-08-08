class VlhmConnect < ApplicationCable::Channel
  def subscribed
    p '!!!!!!!!!! VlhmConnect subscribed !!!!!!!!!'
    # Подписка на канал
    stream_from "vlhm_connect"
  end

  def unsubscribed
    # Любая необходимая очистка при отключении
  end

  def receive(data)
    # Обработка входящих данных от клиента
    ActionCable.server.broadcast("vlhm_connect", data)
  end
end
