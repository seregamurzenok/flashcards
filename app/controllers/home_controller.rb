class HomeController < ApplicationController
  def index
    @random_card = Card.where("review_date <= ?", Date.today).order("RANDOM()").limit(1)
  end

  def check_translation
    @card = Card.find(params[:card_id])
    if @card.check_translation(params[:q])
      flash[:notice] = "Правильный перевод"
      @card.set_review_date
      @card.update(:review_date => @card.review_date)
    else 
      flash[:notice] = "Неправильный перевод"
    end
    redirect_to root_path  
  end  
end
