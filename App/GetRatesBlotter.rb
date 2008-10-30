#--------------------------------------------------
# Retreive and format currency pairs
# Matt Hayford
# October 2008
#--------------------------------------------------

class RateBlotter
  require 'net/http'
  
  attr_accessor :rates, :parsedrates

  def getrate(key)
    query = Hash.new 
    query['Key'] = key
    url = URI.parse('http://api.efxnow.com/DEMOWebServices2.8/Service.asmx/GetRatesBlotter') 
    res = Net::HTTP.post_form(url, query) 
    @rates = /.*>.*\s*.*>(.*)<.*/.match(res.body)[1]
  end

  def parserate
    parsedrates = @rates
    @rates = parsedrates.gsub(/\\/, " ")
    parsedrates = @rates
    @rates = parsedrates.gsub(/\$/, "\n")
    # do bunch of fancy parsing to remove delimiters and format info
    # return @rates = @parsedrates
  end

  def returnrate
    return @rates
  end

end