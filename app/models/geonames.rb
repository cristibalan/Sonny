Geoname = Struct.new :name, :description, :forecast_url

class Geoname
  def self.search(q)
    # url = "http://ws.geonames.org/searchJSON?q=#{q}&maxRows=10&lang=en&style=medium"
    url = "file://localhost/Users/chelu/work/me/macrubyhax/Sonny/test/fixtures/geonames.json"

    url = NSURL.URLWithString(url)
    content = NSMutableString.alloc.initWithContentsOfURL(url, encoding:NSUTF8StringEncoding, error:nil)

    JSON.parse(content)["geonames"].map do |geoname|
      description = "#{geoname["name"]} - #{geoname["fclName"].split(",")[0]} in #{geoname["adminName1"]} (#{geoname["countryName"]})"
      forecast_url = "http://www.yr.no/place/#{geoname["countryName"]}/#{geoname["adminName1"]}/#{geoname["name"]}/"

      self.new(geoname["name"], description, forecast_url)
    end
  end
end
