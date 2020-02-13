require 'open-uri'
require 'pry'

class Volunteer::Scraper

BASE_PATH = "https://www.volunteermatch.org/search/?l=Atlanta,%20GA,%20USA&categories=39"      

    def self.scrape_titles
        main_page = Nokogiri::HTML(open(BASE_PATH))
    
        main_page.css("div.searchitem.PUBLIC").collect do |info|
            {:title => info.css("a.link-body-text.psr_link").text.strip,
            :organization => info.css("span.orgid a.psr_link").text.strip,
            :learn_more => info.css("a").attr("href").value   
            }         
                           
        end   
    end 

    def self.scrape_details(learn_more)
        details_page = Nokogiri::HTML(open("https://www.volunteermatch.org" + learn_more))
        
        details_page.css("div.grid.grid--container.justify-space-between.opp-dtl").collect do |details|           
            {:description => details.css("div#short_desc").text.strip,
             :address => details.css("div.col-7 address").text.strip,
             :date => details.css("div.date-start").text,
             :requirements => details.css("ul.list").text.strip 
            }           
        end
    end
end