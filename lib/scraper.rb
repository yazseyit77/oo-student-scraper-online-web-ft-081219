require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    #index_url.css(".student-card")
    #name: student.css(".student-card").first.css("h4.student-name").text.strip
    #location: student.css(".student-card").first.css("p.student-location").text.strip
    #profile_url: student.css(".student-card").first.css("a").attribute("href").text.strip
    students = []
    #binding.pry
    page.css(".student-card").each do |student|
      students[student.to_sym] = {
        :name => student.css(".student-card").first.css("h4.student-name").text.strip,
        :location => student.css(".student-card").first.css("p.student-location").text.strip,
        :profile_url => student.css(".student-card").first.css("a").attribute("href").value
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
