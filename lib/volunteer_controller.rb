require_relative "../lib/scraper.rb"
require_relative "../lib/volunteer.rb"
require "nokogiri"
require "colorize"
require "pry"

class Volunteer::VolunteerController

    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "
        input = gets.strip
        #will take in input and return a list of volunteer opportunities/titles and organization names
        Volunteer::Scraper.scrape_titles
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
    end


     def get_list(input)
        binding.pry
        puts "Here is a list of opportunities and organizations looking for volunteers in Atlanta, GA : "
        input = gets.strip
        
        if input == 'list'
            puts Volunteer::Scraper.scrape_titles
        else 
            puts "Invalid input, please try again."
            self.get_titles
        end
        
    end



    #  def display_details
        
    
    
    # end
    
end