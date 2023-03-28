require 'test_helper'

class UserPromotionTest < ActiveSupport::TestCase

  def setup
    @user = User.create(nickname: "User", description: "Description user")
    @promotion = Promotion.create(title: "Black Friday", description: "Big discounts on all products!", start_date: Time.now, end_date: 2023-04-01)
    @user_promotion = UserPromotion.new(user_id: @user, promotion_id: @promotion)
  end

  #Teste para verificar se user_promotion é válido
  test "should be valid" do
    assert @user_promotion.valid?
  end

  #Teste para verificar se uma promoção está sendo salva sem um usuário correspondente
  test "should not save without user" do
    @user_promotion.user = nil
    refute @user_promotion.save, "Saved the user promotion without a user"
  end
 
  #Teste para verificar se está sendo salvo sem uma promoção
  test "should not save without promotion" do
    @user_promotion.promotion = nil
    refute @user_promotion.save, "Saved the user promotion without a promotion"
  end
 
  #Teste para verificar se está sendo salvo uma promoção já expirada
  test "should not save if promotion is expired" do
    @promotion.end_date = Time.now - 1.day
    refute @user_promotion.save, "Saved the user promotion with an expired promotion"
  end

end

