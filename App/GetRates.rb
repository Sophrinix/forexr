#--------------------------------------------------
# Retreive and format currency pairs
# Matt Hayford
# October 2008
#--------------------------------------------------

class Rate
  require 'net/http'
  attr_accessor :rates, :quote, :pairpointer
  
# retreive quote array from api.efxnow.com
  def getrate(key)
    query = Hash.new 
    query['Key'] = key
    url = URI.parse('http://api.efxnow.com/DEMOWebServices2.8/Service.asmx/GetRates') 
    res = Net::HTTP.post_form(url, query) 
    @rates = /.*>.*\s*.*>(.*)<.*/.match(res.body)[1]
  end

# format quote array, remove delimiter
  def parserate
    @rates = @rates.gsub(/\\/, " ")
    @rates = @rates.split(/\$/)
  end

# find pair index array element number
  def getname(name)

    a = @rates
    n = @rates.length 
    n = n - 1

    for i in 0..n
      if a[i].index(name)
        @pairpointer = i
      end
    end
  end

# create array of quote removing space delimiters and extraneous data
  def formater
    i = @pairpointer
    @quote = @rates[i].split(/ /)
    @quote.delete_at(3)
    @quote.delete_at(5)
    @quote.delete_at(5)
  end

# return formatted single quote array
  def quote
    return @quote
  end

# return all rates array
  def rate
    return @rates
  end

# return individual array element
  def price(n)
    case n
    when 'pair' then return @quote[0]
    when 'bid' then return @quote[1]
    when 'ask' then return @quote[2]
    when 'high' then return @quote[3]
    when 'low' then return @quote[4]
    end
  end

end