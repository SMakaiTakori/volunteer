
require "pry"

class Volunteer::VolunteerController

    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "
        input = gets.strip
        #will take in input and return a list of volunteer opportunities/titles and organization names
       make_list
    end
    
    def prompt
        puts "Would you like to see more details about these opportunities, type 'Yes' or 'No' to continue "      
        input = gets.strip 
        
        if input == 'Yes'
            puts self.display_details
        elsif input == 'No'
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


    def get_list(input)
        
        puts "Here is a list of opportunities and organizations looking for volunteers in Atlanta, GA : "
        input = gets.strip
        
        if input == 'list'
            self.display_list
        else 
            puts "Invalid input, please try again."
            self.get_titles
        end
       
    end

    def display_list
        

    end


    #  def display_details
        
    
    
    # end
    
end