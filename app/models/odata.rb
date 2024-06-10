class Odata
  def initialize(url)
    @url = URI.parse(url)
  end

  def each(&block)
    loop do
      puts @url
      @response = JSON.parse(URI.open(@url).read)
      puts @response.inspect
      @response["value"]&.each(&block)
      break unless @response["odata.nextLink"].present?
      @url = @response["odata.nextLink"]
    end
  end
end
