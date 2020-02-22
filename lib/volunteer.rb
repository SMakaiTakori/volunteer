class Volunteer::Volunteer

attr_accessor :title, :organization, :address, :description, :date, :requirements, :learn_more, :details

    @@all = []

    def initialize(title, organization, details, description, address, date, requirements)
        
        @title = title
        @organization = organization
        @details = details  
        @description = description
        @address = address
        @date = date
        @requirements = requirements  
                        
        @@all << self
    end

    def self.all
        @@all   
    end 

end
