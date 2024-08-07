require 'em-websocket'

HOST = '0.0.0.0'
PORT = 3000

EventMachine.run do
  p "server started on port #{PORT}"

  @clients = []

  EM::WebSocket.start(:host => HOST, :port => PORT) do |ws|
    p "client connected: #{ws.remote_ip}"

    ws.onopen do |handshake|
      @clients << ws
      ws.send "Connected to server on path: #{handshake.path}."
    end

    ws.onclose do
      ws.send 'Closed.'
      @clients.delete ws
    end

    ws.onmessage do |msg|
      puts "Received Message: #{msg}"
      @clients.each do |socket|
        socket.send msg if socket != ws
      end
    end
  end

end
