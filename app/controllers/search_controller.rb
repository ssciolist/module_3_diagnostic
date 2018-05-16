class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{params[:q]}")
    body = conn.get.body

    raw_results = JSON.parse(body, symbolize_names: true)
    raw_results[:fuel_stations].map do |station|
      Station.new(station)
    end

    @stations = Station.all
  end
end
