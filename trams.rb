@tram_one = ["airport", "gyle centre", "edinburgh park", "murrayfield", "haymarket", "princess street", "york place" ]

@tram_two = ["saltire square", "west pilton", "telford road", "craigleith"]

@tram_three = ["gallery of modern art", "haymarket", "eicc", "bread street", "tollcross", "the meadows"]

def get_tram(direction)
  puts
  print "What tram are you getting #{direction}? "
  tram = gets.chomp.downcase
  (tram == "one") || (tram == "two") || (tram == "three") ? tram : tram_error(direction)
end

def get_stop(tram)
  puts
  puts "Tram #{tram} stops: #{instance_variable_get("@tram_#{tram}").join(', ')}."
  print "What stop on tram #{tram}? "
  stop = gets.chomp.downcase
  instance_variable_get("@tram_#{tram}").include?(stop) ? stop : stop_error(tram)
end

def get_route
  @tram_on = get_tram("on")
  @stop_on = get_stop(@tram_on)
  @tram_off = get_tram("off")
  @stop_off = get_stop(@tram_off)
end

def stops_travelled
  get_route
  [@tram_one.index(@stop_on), @tram_one.index(@stop_off)].max - [@tram_one.index(@stop_on), @tram_one.index(@stop_off)].min
end

def stop_error(tram)
  print "Please enter a valid stop. "
  get_stop(tram)
end

def tram_error(direction)
  print "Please enter a valid tram. "
  get_tram(direction)
end

puts "You have travelled #{stops_travelled} stops."
