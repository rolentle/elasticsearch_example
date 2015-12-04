# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
class PrimaryCareFacilitiesEtl
  attr :primary_care_facilities
  def initialize(file ='./lib/Primary_Care_Facilities.geojson')
    @primary_care_facilities = JSON.parse(File.read(file))['features']
  end

  def filtered_facilities
    primary_care_facilities.map do |facility|
      {
        lat: facility["geometry"]["coordinates"][1],
        long: facility["geometry"]["coordinates"][0],
        name: facility["properties"]["NAME"],
        address: facility["properties"]["ADDRESS"],
        city: facility["properties"]["CITY"],
        state: facility["properties"]["STATE"],
        zip: facility["properties"]["ZIP"],
        web_url: facility["properties"]["WEB_URL"]
      }
    end
  end

  def load
    filtered_facilities.each do |facility|
      Facility.create(facility)
    end
  end
end

PrimaryCareFacilitiesEtl.new.load
