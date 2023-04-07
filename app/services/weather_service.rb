class WeatherService
  require 'net/http'
  require 'json'

  def self.fetch_weather(city)
    url = "https://api.weatherapi.com/v1/current.json?key=81835e6fbc9249159ac52210230704&q=#{city}&aqi=yes"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather_data = JSON.parse(response)
    {
      temp_c: weather_data["current"]["temp_c"],
      condition_text: weather_data["current"]["condition"]["text"],
      icon_url: "https:#{weather_data["current"]["condition"]["icon"]}"
    }
  end
end