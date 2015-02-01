desc "Where the magic happens. Eventually will call out to a weather api for data to post somewhere"
task :transmit_temperature do

  class WundergroundClient
    def self.fetch_temp(loc)
      url = "http://api.wunderground.com/api/5011e74bd6fddfe9/geolookup/conditions/q/#{loc}.json"
      result = HTTParty.get(url)
      name = result['current_observation']['observation_location']['full']
      temp = result['current_observation']['temp_f']
      puts "temp is #{temp}"
      return name, temp
    end
  end

  require 'httparty'
  name, temp = WundergroundClient.fetch_temp("84047")
  params = { station_name: name,
             station_id: "1",
             time: Time.now,
             reading: temp,
           }

  HTTParty.post("#{ENV['THERMOMETER_PATH']}/temperature_readings",
                body: {temperature_reading: params})
end
