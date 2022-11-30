require_relative 'item'
class Movie < Item
        puts 'Movie can be archived'

def initialize(name, source, publish_date, silet:false)
    super(publish_date)
    @name = name
    @silet = silet
    @source = source
end

def can_be_archieved?
    super && @silet
 end
    
 sholey = Movie.new('Sholey', 'VCD', '1990', silet: true)
 puts sholey.name

end
