require_relative "../lib/scraper.rb"
require_relative "../lib/volunteer.rb"
require "nokogiri"
require "colorize"


class Volunteer::VolunteerController

    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "
        input = gets.strip
        #will take in input and return a list of volunteer opportunities/titles
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

     def display_details
        
    
    
    end

end