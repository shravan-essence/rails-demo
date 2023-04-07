class WeatherController < ApplicationController
  def show
    @city = Author.find[params[:city]] || "New York"
    @weather_data = WeatherService.fetch_weather(@city)
    redirect_to url_for(:controller => :authors, :action => :show)
  end
end