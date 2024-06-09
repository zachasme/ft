require 'open-uri'

class VotesController < ApplicationController
  def index
    url = URI.parse('https://oda.ft.dk/api/Afstemning?$expand=Sagstrin/Sag,Stemme/Stemmetype,Stemme/Akt%C3%B8r&$orderby=id desc&$top=10')
    @response = JSON.parse(URI.open(url).read)
  end
end
