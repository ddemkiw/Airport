module Weather

STORM_THRESHOLD = 90

WEATHER_VARIANCE = 100

def stormy_weather?
  @stormy = false
  rand(WEATHER_VARIANCE) > STORM_THRESHOLD ? !@stormy : @stormy
end

end