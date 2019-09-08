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
    page.css(".student-card").each do |student|
      student_info = {
        :name => student.css("h4.student-name").text.strip,
        :location => student.css("p.student-location").text.strip,
        :profile_url => student.css("a").attribute("href").value
      }
      students << student_info
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))

    person = {}
    profile.css.each do 

  end

end
