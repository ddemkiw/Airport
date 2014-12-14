require './lib/weatherconditions.rb'

class Weather; include WeatherConditions; end

describe WeatherConditions do
  
  let(:weather_now) {WeatherConditions.new}

  it "should have three types of weather"
  expect(weather.length).to eq(3)
  end

end