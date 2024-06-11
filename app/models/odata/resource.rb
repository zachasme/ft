class Odata::Resource
  include ProgressBar::WithProgress

  BASE = "https://oda.ft.dk/api/"
  DATA_BEGIN = 1.months.ago

  def initialize(resource, filter: [], expand: [], after: DATA_BEGIN)
    url = BASE + CGI.escape(resource)
    url += "?$inlinecount=allpages&$orderby=opdateringsdato"
    filters = Array.wrap(filter)
    if after.present?
      filters << "opdateringsdato gt datetime'#{after.iso8601}'"
    end
    url += "&$filter=" + filters.join(" and ") unless filters.empty?
    if expand.present?
      url += "&$expand=" + Array.wrap(expand).map { |x| CGI.escape x }.join(",")
    end
    @url = URI.parse(url)
    puts @url
    @response ||= JSON.parse(URI.open(@url).read)
  end

  def each(&block)
    loop do
      @response["value"]&.each(&block)
      break unless @response["odata.nextLink"].present?
      @url = @response["odata.nextLink"]
      @response = JSON.parse(URI.open(@url).read)
    end
  end

  def count
    @count ||= @response["odata.count"].to_i
  end
end
