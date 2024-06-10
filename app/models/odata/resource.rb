class Odata::Resource
  BASE = "https://oda.ft.dk/api/"

  def initialize(resource, filter: [], expand: [], after: nil)
    url = BASE + CGI.escape(resource)
    url += "?$inlinecount=allpages"
    filters = Array.wrap(filter)
    if after.present?
      filters << "opdateringsdato gt datetime'#{after.iso8601}'"
    end
    url += "&$filter=" + filters.join(" and ")
    if expand.present?
      url += "&$expand=" + Array.wrap(expand).map { |x| CGI.escape x }.join(",")
    end
    @url = URI.parse(url)
    puts @url
  end

  def each(&block)
    loop do
      @response = JSON.parse(URI.open(@url).read)
      @response["value"]&.each(&block)
      break unless @response["odata.nextLink"].present?
      @url = @response["odata.nextLink"]
    end
  end
end
