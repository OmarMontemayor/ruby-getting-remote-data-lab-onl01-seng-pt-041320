require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetRequester

    def initialize(url = "https://swapi.dev/api/films/")
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
    
    def film_creator
      self.get_response_body.parse_json.each do |title, episode_id|
            binding.pry
            Film.new(title,episode_id)
        end
    end
end

