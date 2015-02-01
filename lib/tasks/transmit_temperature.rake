desc "Where the magic happens. Eventually will call out to a weather api for data to post somewhere"
task :transmit_temperature do
  require 'httparty'
  puts "it's working"
  params = { station_name: "Bedroom",
             station_id: "1",
             time: Time.now,
             reading: 40,
           }

  HTTParty.post("#{ENV['THERMOMETER_PATH']}/temperature_readings",
                body: {temperature_reading: params})
end
