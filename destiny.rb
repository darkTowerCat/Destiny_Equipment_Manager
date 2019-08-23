require "net/http"

require "uri"


#get api from external file
file = File.open("api-key.txt")
api_key = file.read.strip
file.close

# get user member id
# https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/2/cortical_iv/
uri = URI("https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/2/cortical_iv/")
req = Net::HTTP::Get.new(uri)
req['X-API-Key'] = api_key

response = Net::HTTP.start(uri.hostname, uri.port, opt = {use_ssl: true}) {
	|http|
	http.request(req)
}
#puts res.body

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
