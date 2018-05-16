class NrelService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{@zipcode}&limit=10&radius=6&fuel_type=ELEC,LPG")
  end

  def raw_results
    body = conn.get.body

    raw_results = JSON.parse(body, symbolize_names: true)
  end
end
