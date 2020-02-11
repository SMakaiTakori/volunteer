require 'open-uri'
require 'pry'

class Volunteer::Scraper

BASE_PATH = "https://www.volunteermatch.org/search/?l=Atlanta,%20GA,%20USA&categories=39"      

    def self.scrape_titles
        main_page = Nokogiri::HTML(open(BASE_PATH))
    #     titles = []
    #     main_page.css("div.search-page").each do |title|
    #         title.css("a")[0].text.strip
    #         title.css("a")[1].text 
    #    
    #     end
    #     titles
    # end

        main_page.css("div.search-page").collect do |info|
            {:title => info.css("a")[0].text.strip,
            :organization => info.css("a")[1].text,
            :learn_more => info.css("a").attr("href").value             
            }     
                  
        end   
    end 

    def self.scrape_details
        details_page = Nokogiri::HTML(open("https://www.volunteermatch.org/search/opp3265982.jsp"))
        details_page.css("div.grid.grid--container.justify-space-between.opp-dtl").collect do |details|
            {:description => details.css("div.opp-dtl__summary p").text


            }
            binding.pry
        end
    end


end