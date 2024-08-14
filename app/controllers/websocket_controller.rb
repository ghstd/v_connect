class WebsocketController < ApplicationController
  def index
    p '==============================='
    p request.ip
    p '==============================='
    html_content = "<h1>Dynamic HTML Content</h1><p>Vlhm_connect service is working</p>"
    render html: html_content.html_safe
  end
end
