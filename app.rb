require "csv"
require "http"
data = CSV.read("breweries_us.csv")

p data[1][2]

response = HTTP.get("http://api.positionstack.com/v1/forward?access_key=cef4e42af25baa2a8e6fe1aeeaeef55f&query=1600 Pennsylvania Ave NW, Washington DC")

p latitude = response.parse(:json)["data"][0]["latitude"]
p longitude = response.parse(:json)["data"][0]["longitude"]

file = CSV.open("example_3.csv", "w") do |csv|
  csv << ["latitude", "longitude"]
  index = 1
  while index < data.length
    address = data[index][2]

    csv << [index, 32]
    index += 1
  end
end
file.close
