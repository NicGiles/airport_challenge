class Weather

def unsafe_weather?
@bad_weather = rand(1..5) == 5
end

end
