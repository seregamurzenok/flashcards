class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
 
  validate :original_and_translated_texts_are_not_equal 

  before_validation :set_review_date

  private

  def set_review_date
    now = DateTime.current
    self.review_date = now + 3.day
  end 
    
  def original_and_translated_texts_are_not_equal
    return unless original_text.strip.capitalize == translated_text.strip.capitalize
    errors.add(:original_text, "original and translated texts are equal")   
  end 
end
