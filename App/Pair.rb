#--------------------------------------------------
# Currency Pair Class
# Matt Hayford
# October 2008
#--------------------------------------------------

class Pair
  attr_accessor :name, :bid, :ask, :high, :low
  
  def initialize(name, bid, ask, high, low)
    @name = name
    @bid = bid
    @ask = ask
    @high = high
    @low = low
  end
  
  def updateinfo(bid, ask, high, low)
    @bid = bid
    @ask = ask
    @high = high
    @low = low
  end
  
  def pairinfo
    return @name, @bid, @ask, @high, @low
  end
  
  def nameinfo
    return @name
  end
  
  def bidinfo
    return @bid
  end
  
  def askinfo
    return @ask
  end
  
  def highinfo
    return @high
  end
  
  def lowinfo
    return @low
  end
  
end