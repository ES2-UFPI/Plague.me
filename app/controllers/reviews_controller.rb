class ReviewsController < ApplicationController
    before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.new(review_params)
    @review.user = current_user
    @review.posted_at = Time.now 
    
    if @review.save
      @game.update_attribute(:rate_game, @game.calculate_average_rating)
      redirect_to game_path(@game), notice: "Review enviada com sucesso!"
    else
       redirect_to game_path(@game), alert: "Não foi possível enviar a review."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to game_path(@review.game_id), notice: "Review excluída com sucesso!"
    else
      redirect_to game_path(@review.game_id), alert: "Você não tem permissão para excluir esta review."
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :score, :user_id)
  end

end
