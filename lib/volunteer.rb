class Volunteer::Volunteer

attr_accessor :title, :organization, :address, :description, :date, :requirements, :learn_more

    @@all = []

    def initialize(attributes)
        attributes.each do |key, value|
            self.send("#{key}=", value)
        end
        @@all << self                
    end

    def self.create_from_collection(list_array)
        list_array.each do |hash|
            Volunteer::Volunteer.new(hash)
        end
    end

    def add_list(list_hash)
        list_hash.each do |key, value|
            self.send("#{key}=", value)
        end
        self
    end

    def self.all
        @@all
    end    
end
