require 'json'
require 'cgi'

`mkdir -p tides`

j = JSON.parse open('stations.json').read

j.each.with_index do |stn, i|
  name, id, lat, long = stn

  url = "https://tidesandcurrents.noaa.gov/cgi-bin/predictiondownload.cgi?name=#{CGI.escape name}&state=FL&stnid=#{CGI.escape id.to_s}&threshold=&thresholdDirection=greaterThan&subordinate=true&referenceName=MIAMI%20BEACH,%20GOVERNMENT%20CUT&referenceId=8723178&heightOffsetLow=0.92&heightOffsetHigh=0.84&timeOffsetLow=108&timeOffsetHigh=54&heightAdjustedType=R&bdate=2017&timezone=LST/LDT&datum=MLLW&clock=12hour&type=xml&annual=true"

  dest = "#{id.to_i}_annual.xml"

  `curl -s -o tides/#{dest} '#{url}'`

  print "\r#{i}\t/#{j.length}"
end

puts
