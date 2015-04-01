require 'elasticsearch'

client = Elasticsearch::Client.new log: true

f = File.open("./llpreg_1980.txt", "r")

f.each_line do |line|
  
  if line.partition(' ').first =~ /^\d+$/ && line.rpartition(' ').last.chomp =~ /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/
    cin = line.split[1]
    company_name = line.split(' ').drop(2).reverse.drop(1).reverse.join(' ')
    client.index  index: 'company', type: 'external', id: cin, body: 
    {
      company_name: company_name
    }
  end

end

f.close


# Iteration 1 Condition [Used for 2009, 2010]
# line[line.length-2] =~ /[0-9]/ && line.length > 23

# Iteration 2 Condition [Used for 2011, 2012, 2013, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998,
# 1997, 1996, 1995, 1994, 1993, 1992, 1991, 1990, 1989, 1988, 1987, 1986, 1985, 1984, 1983, 1982]
# line.partition(' ').first =~ /^\d+$/ && line.rpartition(' ').last.chomp =~ /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/

# File 2000 - E