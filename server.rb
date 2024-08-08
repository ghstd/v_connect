# require 'em-websocket'
# require 'webrick'

# HOST = '0.0.0.0'
# PORT = 3000

# # Thread.new do
# #   server = WEBrick::HTTPServer.new(Port: PORT)
# #   server.mount_proc '/' do |req, res|
# #     res.body = 'HTTP Server is running'
# #   end
# #   trap 'INT' do
# #     server.shutdown
# #   end
# #   server.start
# # end

# EventMachine.run do
#   p "server started on port #{PORT}"

#   @clients = []

#   EM::WebSocket.start(:host => HOST, :port => PORT) do |ws|
#     p "client connected: #{ws.remote_ip}"

#     ws.onopen do |handshake|
#       @clients << ws
#       ws.send "Connected to server on path: #{handshake.path}."
#     end

#     ws.onclose do
#       ws.send 'Closed.'
#       @clients.delete ws
#     end

#     ws.onmessage do |msg|
#       puts "Received Message: #{msg}"
#       @clients.each do |socket|
#         socket.send msg if socket != ws
#       end
#     end
#   end

# end


require 'socket'

server = TCPServer.new 3001 # Server bound to port 2000

loop do
  client = server.accept    # Wait for a client to connect
  client.puts "Hello !"
  client.puts "Time is #{Time.now}"
  client.close
end
