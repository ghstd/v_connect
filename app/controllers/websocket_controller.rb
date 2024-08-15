class WebsocketController < ApplicationController
  def index
    html_content = "<h1>Vlhm_connect service is working!</h1>"
    render html: html_content.html_safe
  end
end
