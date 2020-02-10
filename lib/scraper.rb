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
    #         binding.pry
    #     end
    #     titles
    # end

        main_page.css("div.search-page").collect do |info|
            {:title => info.css("a")[0].text.strip,
            :organization => info.css("a")[1].text 
            }
            binding.pry
        end   
    end 
end