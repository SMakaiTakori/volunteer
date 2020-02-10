require 'open-uri'
require 'pry'

class Volunteer::Scraper

def self.scrape_titles(main_url)
    main_page = Nokogiri::HTML(open(main_url))
    titles = []
    main_page.css("div.searchitem.PUBLIC").each do |title|
        title.css("a.link-body-text psr_link").text
    end
    titles

    binding.pry
end