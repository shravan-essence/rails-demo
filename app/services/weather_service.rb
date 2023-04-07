class WeatherService
  require 'net/http'
  require 'json'

  # attr_accessor :city, :weather_data

  def initialize(city_name)
    @city = city_name
  end

  def call
    fetch_weather
    prepare_json_data
  end

  private

  def fetch_weather
    url = "https://api.weatherapi.com/v1/current.json?key=81835e6fbc9249159ac52210230704&q=#{@city}&aqi=yes"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @weather_data = JSON.parse(response)
  end

  def prepare_json_data
    {
      temp_c: @weather_data["current"]["temp_c"],
      condition_text: @weather_data["current"]["condition"]["text"],
      icon_url: "https:#{@weather_data["current"]["condition"]["icon"]}"
    }
  end
end