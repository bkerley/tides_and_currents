require 'json'
require 'open-uri'
require 'csv'
require 'pry'

field_names = %w{geoGroupName stationId lat lon}

# florida
json = open('https://tidesandcurrents.noaa.gov/mdapi/latest/webapi/geogroups/1397/children.json')

doc = JSON.parse json.read

out_json = doc['stationList'].map do |stn|
  next if stn['stationId'].nil?

  print '.'

  field_names.map do |fn|
    stn[fn]
  end
end.compact

File.open('stations.json', 'w'){ |f| f.write JSON.generate out_json }

puts
