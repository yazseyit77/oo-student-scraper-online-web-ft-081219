require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    #name: index_url.css(".student-card").first.css("h4.student-name").text.strip
    #name: index_url.css(".student-card").first.css("p.student-location").text.strip

    index_url.css(".student-card").text.strip
    binding.pry

  end

  def self.scrape_profile_page(profile_url)

  end

end
