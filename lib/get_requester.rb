# Write your code here
require 'net/http'
require 'open-uri'
require 'json'
require 'pry'
class GetRequester
  
  def initialize(url)
    @url = url
  end
  
  def get_response_body
  #return body of response 
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def parse_json
    data = JSON.parse(self.get_response_body)
    data
  end
end