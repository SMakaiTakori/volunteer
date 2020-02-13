
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

    def make_list
        list_array = Volunteer::Scraper.scrape_titles
        Volunteer::Volunteer.create_from_collection(list_array)
        # needs to go inside make details method
        # Volunteer::Scraper.scrape_details(Volunteer::Volunteer.all[0].learn_more)
    
    end

    def get_list           
        input = nil

        while input != 'quit' 
            input = gets.strip
        
            if input.downcase == 'list'            
                self.display_list
                # self.print_list
                self.prompt
            elsif input.downcase == 'quit'
                self.quit_app   
            else                 
                puts "Invalid input, please try again."
                self.get_list
            end                            
        end      
    end

    def prompt
        puts "Would you like to see more details about these opportunities, type 'Yes' or 'No' to continue "      
        input = gets.strip 
        
        if input.downcase == 'yes'
            self.display_details
        elsif input.downcase == 'no'
            self.welcome
        elsif input.downcase == 'quit'
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

    # def print_list
        
    #    end
   
   

    def quit_app
        exit
    end


    #  def display_details
        
    
    
    # end
    
end