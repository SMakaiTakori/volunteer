
require "pry"

class Volunteer::VolunteerController

    attr_accessor :current_opportunity
    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "
        #will take in input and return a list of volunteer opportunities/titles and organization names
       make_list
       get_input
       prompt
    end   

    def make_list
        list_array = Volunteer::Scraper.scrape_titles
        Volunteer::Volunteer.create_from_collection(list_array)       
    end

    def show_details
        details_array = Volunteer::Scraper.scrape_details(Volunteer::Volunteer.all[0].learn_more)
        Volunteer::Volunteer.create_from_collection(details_array)
        binding.pry

    end

    def get_input           
        input = nil

        while input != 'quit' 
            input = gets.strip
        
            if input.downcase == 'list'            
                self.display_list                
                self.prompt
            elsif input.downcase == 'no'
                puts "See you later, have a great day!"
                self.quit_app   
            # elsif input.to_i <= Volunteer::Volunteer.all.length && input.to_i > 0
            #     self.current_opportunity = Volunteer::Volunteer.all[input.to_i-1]   
            #     puts ""


            else                 
                puts "Invalid input, please try again."
                self.get_input
            end                            
        end      
    end

    def prompt
        puts "Would you like to see more details about these opportunities, type 'yes' for details menu or 'no' to leave the app : "      
        input = gets.strip 
        
        if input.downcase == 'yes'
            self.display_details
        elsif input.downcase == 'no'
            puts "See you later, have a great day!"
            self.quit_app        
        else    
            puts "Invalid input, please try again."
            self.prompt   
        end  
    end

    def display_list
        puts "Here is a list of opportunities and organizations looking for volunteers in Atlanta, GA : "
        Volunteer::Volunteer.all.each.with_index do |list, index|            
            puts "#{index + 1}. #{list.title}"           
        end                    
    end        
   
    def display_details        
        puts "Here is a list of details for the opportunity you chose: "    
    
    end

    def quit_app
        exit
    end


    
    
end