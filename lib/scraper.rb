require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    index_url.css(".student-card").text
    binding.pry
    
  end

  def self.scrape_profile_page(profile_url)

  end

end
