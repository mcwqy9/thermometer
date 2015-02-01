desc "Where the magic happens. Eventually will call out to a weather api for data to post somewhere"
task :transmit_temperature do
  require 'httparty'
  puts "it's working"
  HTTParty.post("http://localhost:3000/temperature_readings", body: {temp: 34})
end
