class Volunteer::Volunteer

attr_accessor :title, :organization, :address, :description, :date, :requirements, :learn_more

@@all = []

def initialize
end

def self.create_from_collection(list_array)
    list_array.each do |hash|
        Volunteer::Volunteer.new(hash)
    end
end
    
end
