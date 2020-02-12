
require "pry"

class Volunteer::VolunteerController

    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "
        #will take in input and return a list of volunteer opportunities/titles and organization names
       make_list
       get_list
       prompt
    end
    
    def prompt
        puts "Would you like to see more details about these opportunities, type 'Yes' or 'No' to continue "      
        input = gets.strip 
        
        if input.downcase == 'yes'
            puts self.display_details
        elsif input.downcase == 'no'
            puts self.welcome
        else 
            puts "Invalid input, please try again."
            self.prompt   
        end  
    end

    def make_list
        list_array = Volunteer::Scraper.scrape_titles
        Volunteer::Volunteer.create_from_collection(list_array)
        # needs to go inside make details method
        # Volunteer::Scraper.scrape_details(Volunteer::Volunteer.all[0].learn_more)
    end

    def get_list        
        
        input = gets.strip
        
        if input.downcase == 'list'            
            display_list
        else 
            puts "Invalid input, please try again."
            get_list
        end      
    end

    def display_list
        puts "Here is a list of opportunities and organizations looking for volunteers in Atlanta, GA : "
        Volunteer::Volunteer.all.each_with_index do |title, index|
            puts "#{index + 1}. #{title.title}"
        # binding.pry
        end
    end


    #  def display_details
        
    
    
    # end
    
end