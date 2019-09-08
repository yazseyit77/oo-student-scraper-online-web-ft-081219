require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    #index_url.css(".student-card")
    #name: student.css(".student-card").first.css("h4.student-name").text.strip
    #location: student.css(".student-card").first.css("p.student-location").text.strip
    #profile_url: student.css(".student-card").first.css("a").attribute("href").text.strip

    students = {}

    index_url.css(".student-card").each do |student|
      students[student.to_sym] = {
        :name => student.css(".student-card").first.css("h4.student-name").text.strip
        :location => student.css(".student-card").first.css("p.student-location").text.strip
        :profile_url => student.css(".student-card").first.css("a").attribute("href").text.strip
      }
    end
    binding.pry
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
