require 'pry'

f = File.open('../black_sheep.txt', 'r')
new_string = ''

f.each_line do |line|
	# binding.pry
	if line.chomp.rpartition(' ').last =~ /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/
		# binding.pry
		new_string << line
	else
		# binding.pry
		new_string << line.chomp + " "
	end
end

ff = File.open('../new_black_sheep.txt', 'w')
ff.write(new_string)

f.close
ff.close