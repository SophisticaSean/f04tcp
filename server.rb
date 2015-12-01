require 'socket'
s = TCPSocket.new "10.0.0.3", 27000
#init = s.gets
arr = []
#puts init
#blarp = init
blarp = "lol"
begin
  until blarp.nil? do
    item = s.recv(5000)
    puts item
    s.write("")
    #s.close_write
    sleep 0.001
    blarp = item
    arr << item.inspect
  end
rescue
  File.write("serverout.txt", arr.join(""))
end
File.write("serverout.txt", arr.join(""))
