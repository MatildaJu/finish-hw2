require_relative "../services/weather_service"

class CitiesController < ApplicationController

  def cities

    @w = WeatherService.get(params[:city])
    @name = params[:name]

    if @w
      @temperature = (9 / 5) * (@w[:temperature] - 273) + 32 # kelv-->fahren

      city = City.new(
        name: params[:city],
        temperature: @temperature, # Using the converted temperature
        description: @w[:description]
      )
      city.save

    end

  end

end
