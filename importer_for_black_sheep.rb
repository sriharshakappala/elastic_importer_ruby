# f = File.open("./llpreg_1991.txt", "r")
# white_sheep = 0
# black_sheep = 0

# f.each_line do |line|
  
#   if line.partition(' ').first =~ /^\d+$/ && line.rpartition(' ').last.chomp =~ /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/
#   	white_sheep += 1
#   else
#   	black_sheep += 1
#   end

# end

# f.close

# puts white_sheep
# puts black_sheep

f = File.open("../black_sheep.txt", "w")

Dir.foreach('./') do |item|
	if item.include? "txt"
		ff = File.open("./" + item, "r")
		ff.each_line do |line|
			if line.partition(' ').first =~ /^\d+$/ && line.rpartition(' ').last.chomp =~ /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/
			else
				f.write(line)
			end
		end
		ff.close
	end
end

f.close