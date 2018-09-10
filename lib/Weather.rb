class Weather
attr_reader :bad_weather

def initialize
  @bad_weather = random_weather
end

def random_weather
@bad_weather = rand(1..5) == 5
end

end
