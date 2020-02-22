class Volunteer::VolunteerController
    
    def welcome
        puts "Welcome to the ATL Volunteer App!"
        puts "Please type 'list' to see a list of current volunteer opportunities focused on reducing Hunger in Atlanta, GA : "   
        make_list
        get_input
    end   

    def make_list
        Volunteer::Scraper.scrape_titles               
    end

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
            puts "#{index + 1}. #{list.title}, "   " Organization Name - #{list.organization} "           
        end                    
    end        
   
    def display_details(input)      
            
        description =  Volunteer::Volunteer.all[input- 1].details[0][:description] 
        address = Volunteer::Volunteer.all[input- 1].details[0][:address]
        date = Volunteer::Volunteer.all[input- 1].details[0][:date]
        requirements =  Volunteer::Volunteer.all[input- 1].details[0][:requirements] 
            
        puts "Here is a list of details for volunteer opportunity number #{input} : "

        puts " "
        puts "Description: "
        puts description
        puts " "
        puts "Address: "   
        puts address
        puts " "
        puts "Date: "
        if  date != ""
            puts date
        else
            puts "No date listed"
        end  
        puts " "
        puts "Requirements : "
        if requirements != ""
            puts requirements
        else 
            puts "No requirements listed"
        end
        puts " "
       
        puts "Type 'list' to see the list again or 'no' to quit the app."
    end 

    def quit_app
        exit
    end

end    
    
