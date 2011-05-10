require 'net/http'
require 'rexml/document'
module ItunesFeed
#def feed
# Itunes top 10 songs
url = 'http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/xml'
utube1 = 'http://gdata.youtube.com/feeds/api/videos?vq='
utube2 = '&start-index=1&max-results=1&fields=entry(media:group(media:player(@url)))'
# get the XML data as a string
@xml_data = Net::HTTP.get_response(URI.parse(url)).body
#puts @xml_data
# extract event information
doc = REXML::Document.new(@xml_data)
#puts doc
@songs = []
@links = []
doc.elements.each('feed/entry/title') do |ele|
   @songs << utube1+ele.text+utube2
end
#puts @songs
@songs.each do |song|
   @xml_udata = Net::HTTP.get_response(URI.parse(URI.encode(song))).body
   udoc = REXML::Document.new(@xml_udata)
   #puts song
   #puts udoc
   udoc.elements.each('feed/entry/media:group/media:player') do |eleu|
   #if eleu.attributes["type"]=='application/x-shockwave-flash' then
     @links << eleu.attributes["url"] end
  # end
   
end

# print all events
#@songs.each_with_index do |song,idx|
#   print "#{utube1}#{song}#{utube2} \n"
#end
#
puts @links
@links.each do |link|
puts link.slice(31,11)
end
end
