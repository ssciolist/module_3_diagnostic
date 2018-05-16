class SearchController < ApplicationController
  def index
    # conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{params[:q]}&limit=10&radius=6&fuel_type=ELEC,LPG")
    # body = conn.get.body
    #
    # raw_results = JSON.parse(body, symbolize_names: true)
    raw_results = NrelService.new(params[:q]).raw_results
  
    raw_results[:fuel_stations].map do |station|
      Station.new(station)
    end


    @stations = Station.all.sort_by {|station| station.distance }
  end
end
