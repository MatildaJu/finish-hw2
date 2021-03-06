require_relative "../services/weather_service"

class MainController < ApplicationController

  def index

    @w = WeatherService.get(params[:city])
    @name = params[:name]

    if @w
      @temperature = (9 / 5) * (@w[:temperature] - 273) + 32 # kelv-->fahren

      city = City.new(name: params[:city],
        temperature: @temperature,
        description: @w[:description]
      )
      city.save

	    berkeley = City.new(name: "Berkeley",
        description: "light clouds",
        temperature: 76.5
      )
      berkeley.save

    end

  end

end
