require "net/http"
require "net/https"
require "uri"

=begin
url = URI.parse("http://www.whatismyip.com/automation/n09230945.asp")

req = Net::HTTP::Get.new(url.path)
req.add_field("X-Forwarded-For", "0.0.0.0")
req.add_field("Accept", "*/*")

res = Net::HTTP.new(url.host, url.port).start do |http|
  http.request(req)
end

puts res.body
=end

#get api from external file
file = File.open("api-key.txt")
api_key = file.read.strip
file.close

#puts api_key
# get user member id
# https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/2/cortical_iv/

domain = URI.parse("https://www.bungie.net/")
path = URI.parse("Platform/Destiny2/SearchDestinyPlayer/2/cortical_iv/")

req = Net::HTTP.new(domain.path,443)
req.use_ssl = true
req.add_field("X-API-Key", api_key)

resp, result = http.get(path)

puts result
# get equipment list
#https://www.bungie.net/Platform/Destiny2/2/Profile/4611686018459314819/?components=205

#unmangle if needed
#https://www.bungie.net/Platform/Destiny2/Manifest/DestinyInventoryItemDefinition/1345867571

# save equipment to external file
=begin
#check overwrite: File.exists?("gear.txt")
File.open("gear.txt","w")
File.write("gear.txt", gear_info) #must be a string
=end

# pull equipment from external file

# get instructions from command line
