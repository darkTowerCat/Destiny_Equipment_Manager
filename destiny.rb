#!/usr/bin/env ruby
require "net/http"
require "json"

player_name = "cortical_iv"
platform = "2"

#get api from external file
file = File.open("api-key.txt")
api_key = file.read.strip
file.close

def get_json(uri, api_key)
	
	
# get player member id
# https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/2/cortical_iv/
player_search = "https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/" + platform + "/" + player_name +"/"
uri = URI(player_search)
req = Net::HTTP::Get.new(uri)
req['X-API-Key'] = api_key

response = Net::HTTP.start(uri.hostname, uri.port, opt = {use_ssl: true}) {
	|http|
	http.request(req)
}
# puts response.body
parsed = JSON.parse(response.body)
player_id = parsed["Response"][0]["membershipId"]

# get equipment list
#https://www.bungie.net/Platform/Destiny2/2/Profile/4611686018459314819/?components=205
gear_search = "https://www.bungie.net/Platform/Destiny2/" + platform + "/Profile/" + player_id + "/?components=205"
uri = URI(gear_search)
req = Net::HTTP::Get.new(uri)
req['X-API-Key'] = api_key

response = Net::HTTP.start(uri.hostname, uri.port, opt = {use_ssl: true}) {
	|http|
	http.request(req)
}
puts response.body
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
