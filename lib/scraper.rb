require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    #name: index_url.css(".student-card").first.css("h4.student-name").text.strip
    #location: index_url.css(".student-card").first.css("p.student-location").text.strip
    #profile_url: index_url.css(".student-card").first.css("a").attribute("href").text.strip

    index_url.css(".student-card").text.strip

  end

  def self.scrape_profile_page(profile_url)

  end

end
