require 'httparty'

  def self.location_lookup(zipcode)
    #make call to api
    zipcode = zipcode.gsub(' ', '')
    url = "http://api.wunderground.com/api/2f1ce0c3fb4069a3/conditions/q/#{zipcode}.json"
    response = HTTParty.get(url)
    response = JSON.parse(response)
    raw_conditions = response['response'].first

    weather_hash = {
      icon: raw_conditions['current_observation']['icon'],
      temp: raw_conditions['current_observation']['temp_f'],
      wind: raw_conditions['current_observation']['wind_mph']
    }
  end

