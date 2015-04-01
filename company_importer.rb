require 'elasticsearch'

client = Elasticsearch::Client.new log: true

f = File.open("./loc2.txt", "r")

f.each_line do |line|
  id = line.partition(' ').first
  cin = line.split[1]
  company_name = line.split(' ').drop(2).reverse.drop(1).reverse.join(' ')
  date_of_inc = line.rpartition(' ').last.chomp
  client.index  index: 'customer', type: 'external', id: id, body: 
  { 
  	cin: cin, 
  	company_name: company_name, 
  	date_of_inc: date_of_inc 
  }
end

f.close

# line[line.length-2].match(/[0-9]/)
# line[line.length-2] =~ /[0-9]/


# Fair Lines
# 1. Line ends with number
# 2. Length greater than 23

# Broken Lines
# 1. Line must not end with number
# 2. Length greater than 23