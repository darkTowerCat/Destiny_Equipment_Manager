require "net/http"
require "uri"

url = URI.parse("http://www.whatismyip.com/automation/n09230945.asp")

req = Net::HTTP::Get.new(url.path)
req.add_field("X-Forwarded-For", "0.0.0.0")
req.add_field("Accept", "*/*")

res = Net::HTTP.new(url.host, url.port).start do |http|
  http.request(req)
end

puts res.body

# get user member id
# https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/2/cortical_iv/


# get equipment list
#https://www.bungie.net/Platform/Destiny2/2/Profile/4611686018459314819/?components=205

#unmangle if needed
#https://www.bungie.net/Platform/Destiny2/Manifest/DestinyInventoryItemDefinition/1345867571

# save equipment to external file

# pull equipment from external file

# get instructions from command line
