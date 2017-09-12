require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Parser
  def initialize(url)
    @url = url
  end 
  
  def create_db_records 
    page = Nokogiri::HTML(open(@url))
  
    lines = page.css('#post-188 > div > table > tbody > tr') 
    lines.shift # delete the table header 
    
    lines.each do |line|
      Card.create(original_text: line.css('td')[1].text, translated_text: line.css('td')[2].text)
    end
  end
end 
