class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
 
  validate :original_and_translated_texts_are_not_equal 

  before_validation :set_review_date

  private

  def set_review_date
    create_date = Time.now

    increased_day = create_date.day + 3
    parse_str = [create_date.year, "-", create_date.month, "-", increased_day].join()
    self.review_date = Date.parse(parse_str).strftime("%d/%m/%Y")
  end 
    
  def original_and_translated_texts_are_not_equal
    if original_text.strip.capitalize == translated_text.strip.capitalize
      errors.add(:original_text, "original and translated texts are equal")
    end   
  end 
end
