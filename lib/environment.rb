require_relative "./volunteer/version"
require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './scraper'
require_relative './volunteer'
require_relative './volunteer_controller'



module Volunteer
  class Error < StandardError; end
  # Your code goes here...
end
