#!/usr/bin/env ruby

require "csv"
#parsed_file = CSV.read("paths_finished.tsv", { :col_sep => "\t" })
nodes = Array.new

CSV.foreach("paths_finished.tsv", { :col_sep => "\t" }) do |row|
  # use row here...
  row[3].split(";").each{ |x|
  	nodes.push(x)
  	#puts x
  }
  
  #nodes.push()
  #nodes.sort!
  #puts nodes
end
nodes.uniq!
nodes = nodes.sort_by{|name| name.downcase}

puts nodes
puts "length: " 
puts nodes.length	

CSV.open("nodes.csv", "wb") do |csv|
	nodes.each_with_index { |x, i| 
		csv << [x, i]}
  # ...
end