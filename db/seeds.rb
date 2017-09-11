require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://1000mostcommonwords.com/1000-most-common-german-words/'))

lines = page.css('#post-188 > div > table > tbody > tr') 
lines.shift #delete the table header 

lines.each do |line|
  Card.create(original_text: line.css('td')[1].text, translated_text: line.css('td')[2].text)
end 
