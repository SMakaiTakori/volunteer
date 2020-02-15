
require "pry"

class Volunteer::VolunteerController

    attr_accessor :current_opportunity
    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "
        #will take in input and return a list of volunteer opportunities/titles and organization names
       make_list
    #    make_details
       get_input
       prompt
    end   

    def make_list
        list_array = Volunteer::Scraper.scrape_titles
        Volunteer::Volunteer.create_from_collection(list_array)    
         
    end

    # def make_details       
    #     details_array = Volunteer::Scraper.scrape_details(Volunteer::Volunteer.all[0].learn_more)                
    #     Volunteer::Volunteer.create_from_collection(details_array)        
    #     binding.pry
    # end

    def get_input           
        input = nil

        while input != 'no' 
            input = gets.strip
        
            if input.downcase == 'list'            
                self.display_list                
                self.prompt
            elsif input.downcase == 'no'
                puts "See you later, have a great day!"
                self.quit_app        
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
            puts "Please enter the number (1-10) of the opportunity you would like more details on : "
            input = gets.strip.to_i
            self.display_details(input)
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
            puts "#{index + 1}. #{list.title} : #{list.organization} "           
        end                    
    end        
   
    def display_details(input) 
        
        description = Volunteer::Scraper.scrape_details(Volunteer::Volunteer.all[input - 1].learn_more)[0][:description] 
        Volunteer::Volunteer.create_from_collection(input)     
     
        puts "Here is a list of details for the opportunity you chose: " 

        Volunteer::Volunteer.all.each.with_index do |list, index|  
        puts "#{list.description}"
        end
    end

    def quit_app
        exit
    end


    
    
end