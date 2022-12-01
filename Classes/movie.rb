require_relative 'item'
class Movie < Item
    attr_accessor :name, :silet, :source
        #puts 'Movie can be archived'

def initialize(name, source, publish_date, silet:false)
    super(publish_date)
    @name = name
    @silet = silet
    @source = source
end

def can_be_archived?
    super && @silet
 end
    
 #sholey = Movie.new("Sholey", "VCD", "2020", silet: false)
 #puts sholey.silet
   # puts sholey.can_be_archived?

end
