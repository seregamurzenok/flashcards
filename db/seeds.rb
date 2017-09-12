require 'parser'

page = Parser.new('http://1000mostcommonwords.com/1000-most-common-german-words/')
page.create_db_records 
