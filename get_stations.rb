require 'json'
require 'open-uri'
require 'csv'
require 'pry'

field_names = %w{geoGroupName stationId lat lon}

# florida
json = open('https://tidesandcurrents.noaa.gov/mdapi/latest/webapi/geogroups/1397/children.json')

doc = JSON.parse json.read

csv = CSV.open('stations.csv', 'w')
csv << field_names

doc['stationList'].each do |stn|
  next if stn['stationId'].nil?

  csv << field_names.map do |fn|
    stn[fn]
  end
  print '.'
end

puts
