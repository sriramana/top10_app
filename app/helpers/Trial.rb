require 'net/http'
require 'rexml/document'

# Web search for "madonna"
url = 'http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/xml'

# get the XML data as a string
xml_data = Net::HTTP.get_response(URI.parse(url)).body

# extract event information
doc = REXML::Document.new(xml_data)
titles = []
links = []
doc.elements.each('feed/entry/title') do |ele|
   titles << ele.text
end


# print all events
titles.each_with_index do |title, idx|
   print "#{title} \n"
end
