#--------------------------------------------------
# Retreive Key Authentication From GAPI Demo Server
# Matt Hayford
# October 2008
#--------------------------------------------------

class Key
  require 'net/http'
  attr_accessor :key

# retreive key from api.efxnow.com
  def getkey(name, passwd)
    query = Hash.new 
    query['UserId'] = name
    query['PWD'] = passwd 
    query['Brand'] = 'GAPI' 
    url = URI.parse('http://api.efxnow.com/DEMOWebServices2.8/Service.asmx/GetRatesServerAuth') 
    res = Net::HTTP.post_form(url, query) 
    @key = /.*>.*\s*.*>(.*)<.*/.match(res.body)[1]
  end

# return authenticated key
  def key
    return @key
  end
  
end