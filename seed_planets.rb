require 'orbiter'
require 'csv'

Orbiter.auto_migrate!
seed_data = []
CSV::Reader.parse(File.open('planets.csv')).each{|row| seed_data << row}

methods = seed_data.shift
seed_data.each do |row|
  orbiter = Orbiter.new
  row.each_with_index do |col, index|
    orbiter.send "#{methods[index]}=", col
  end
  orbiter.save
end

orbiters = Orbiter.all
puts "orbits!"
orbiters.each do |orbiter|
  puts orbiter.inspect
end
