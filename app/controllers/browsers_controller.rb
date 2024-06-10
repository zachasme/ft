require "open-uri"

class BrowsersController < ApplicationController
  PAGE_SIZE = 100

  def show
    @page = [ params[:page].to_i, 1 ].max
    skip = (@page - 1) * PAGE_SIZE
    url = "https://oda.ft.dk/api/Afstemning?$expand=Sagstrin/Sag,Stemme/Stemmetype,Stemme/Akt%C3%B8r&$orderby=id desc&$inlinecount=allpages&$skip=#{skip}"
    url += "&$filter=substringof('#{CGI.escape(params[:search])}', Sagstrin/Sag/titel)" if params[:search]
    puts url
    @response = JSON.parse(URI.open(URI.parse(url)).read)
  end

  def edit
    SynchronizationJob.perform_now
    redirect_to browser_path
  end
end
