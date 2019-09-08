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
  #   profile = Nokogiri::HTML(open(profile_url))
  #   person = {}
  #
  #   icons = profile.css.(".social-icon-container a").collect{|icon| icon.attribute("href").value}
  #   icons.each do |link|
  #     if link.include?("twitter")
  #       person[:twitter] = link
  #     elsif link.include?("linkedin")
  #       person[:linkedin] = link
  #     elsif link.include?("github")
  #       person[:github] = link
  #     elsif link.include?(".com")
  #       person[:blog] = link
  #     end
  #   end
  # #  binding.pry
  #   person[:profile_quote] = profile.css(".profile-quote").text
  #   person[:bio] = profile.css("div.description-holder p").text
  #   person

  profile = Nokogiri::HTML(open(profile_url))
      person = {}
    icons = profile.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
      icons.each do |link|
        if link.include?("twitter")
          person[:twitter] = link
        elsif link.include?("linkedin")
          person[:linkedin] = link
        elsif link.include?("github")
          person[:github] = link
        elsif link.include?(".com")
          person[:blog] = link
        end
      end
      person[:profile_quote] = profile.css(".profile-quote").text
      person[:bio] = profile.css("div.description-holder p").text
      person
  end

end
