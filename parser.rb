def id_grab(arr, index)
  temp = []
  4.times do |i|
    temp << arr[index - i]
  end
  return [temp.reverse.join(""), rev_convert(arr)]
end

def rev_convert(arr)
  arr.reverse.join("").to_i(16)
end

def find_in_arr(find, arr)
  arr.index(find)/2
end

look_for = [{ :name => "caps", :type => "03", :look_for => "43 61 70 73 00" },
            { :name => "level", :type => "03", :look_for => "58 50 4c 65 76 65 6c" },
            { :name => "stimpaks", :type => "04", :look_for => "53 74 69 6d 70 61 6b 43 6f 75 6e 74" },
            { :name => "radaway", :type => "04", :look_for => "52 61 64 61 77 61 79" }]




to_read = ARGV[0]
#to_write = ARGV[1]

dump = IO.readlines(to_read).first.to_s
dump_arr = dump.split
dump_no_space = dump_arr.join()


case_list = %w[00, 01, 02, 03, 04, 05, 06, 07, 08]

look_for.each do |hash|
  find = hash[:look_for]
  type = hash[:type]
  name = hash[:name]
  temp = []

  find = find.gsub(" ", "")
  index = find_in_arr(find, dump_no_space) - 1
  4.times do |i|
    temp << dump_arr[index - i]
  end
  # need to reverse becase we went backwards thru the array
  temp = temp.reverse
  id = temp.join("")
  human_id = rev_convert(temp)

  index = find_in_arr(type + id, dump_no_space) + 5
  temp = []
  4.times do |i|
    temp << dump_arr[index + i]
  end
  value = rev_convert(temp)
  puts "#{name}: #{value}"
end

#dump_arr.each_with_index do |item, i|
  #case item
  #when "03"
    #temp = []
    #id = id_grab(dump_arr, i)
    #index = i + 5
    #until case_list.include? dump_arr[index]
      #temp << dump_arr[index]
      #index += 1
    #end
    #amount = rev_convert(temp)
    #if amount < 1000000
      #puts "#{id}: #{amount}"
    #end
    #amount = 0
  #end
  #when "06"
    #temp = []
    #id = id_grab(dump_arr, i)
    #index = i + 5
    #until case_list.include? dump_arr[index]
      #temp << dump_arr[index]
      #index += 1
    #end
    #string = temp.map{|i| [i].pack("H*")}.join("")
    #unless string.empty?
      #puts string
      ##sleep 0.1
    #end
  #end
#end


# 0x ID ID ID ID IN IN IN IN
# example: 64 aa is the id for XPLevel(58 50 4c 65 76 65 6c)
# 60 aa is the id for Caps
# you have to reverse the number, 03 | 17 b2 00 00 | 2a cf 00 00 | the last part needs to be 00 00 cf 2a 
#
  
