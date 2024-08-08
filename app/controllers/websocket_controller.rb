class WebsocketController < ApplicationController
  def index
    p '==============================='
    p request.ip
    p '==============================='
    head :ok
  end
end
