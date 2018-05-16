class SearchController < ApplicationController
  def index
    @stations = Station.search_results
  end
end
