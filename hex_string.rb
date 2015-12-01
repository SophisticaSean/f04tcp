to_read = ARGV[0]
to_write = ARGV[1]


dump = IO.readlines(to_read)
split_dump = dump.to_s.split
no_x = []

split_dump.each do |item|
  if item.include? "0x"
    no_x << item
  end
end

#no_x.map! do |item|
  #item.gsub(",", "").gsub(/"/, "").gsub(/0x/, "")
#end
puts no_x.join("").unpack("H*")
#File.write(to_write, no_x.join(" "))

