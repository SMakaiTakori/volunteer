class Volunteer::Volunteer

attr_accessor :title, :organization, :address, :description, :date, :requirements, :learn_more, :details

    @@all = []

    def initialize(title,organization,details)
        
        @title = title
        @organization = organization
        @details = details    
                        
        @@all << self
    end

    def self.all
        @@all   
    end 

end
