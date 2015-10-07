@tram_routes = { 
  one: ["airport", "gyle centre", "edinburgh park", "murrayfield", "haymarket", "princess street", "york place"], 
  two: ["saltire square", "west pilton", "telford road", "craigleith", "haymarket"], 
  three: ["gallery of modern art", "haymarket", "eicc", "bread street", "tollcross", "the meadows"] 
}

def get_tram(direction)
  puts
  print "What tram are you getting #{direction}? "
  tram = gets.chomp.downcase.to_sym
  (tram == :one) || (tram == :two) || (tram == :three) ? tram : tram_error(direction)
end

def get_stop(tram)
  puts
  stop_list = @tram_routes[tram]
  puts "Tram #{tram} stops: #{stop_list.join(', ')}."
  print "What stop on tram #{tram}? "
  stop = gets.chomp.downcase
  stop_list.include?(stop) ? stop : stop_error(tram)
end

def get_route
  @tram_on = get_tram("on")
  @stop_on = get_stop(@tram_on)
  @tram_off = get_tram("off")
  @stop_off = get_stop(@tram_off)
end

def stops_travelled
  get_route
  if @tram_on == @tram_off
    stop_numbers = [@tram_routes[@tram_on].index(@stop_on), @tram_routes[@tram_off].index(@stop_off)]
    stop_numbers.max - stop_numbers.min
  else
    intersect = (@tram_routes[@tram_on] & @tram_routes[@tram_off]).pop.to_s
    first_leg = [@tram_routes[@tram_on].index(@stop_on), @tram_routes[@tram_on].index(intersect)]
    second_leg = [@tram_routes[@tram_off].index(intersect), @tram_routes[@tram_off].index(@stop_off)]
    (first_leg.max - first_leg.min) + (second_leg.max - second_leg.min) 
  end
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
