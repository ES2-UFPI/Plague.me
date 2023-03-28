require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #Teste para cadastro de user com todos os atributos
  test "should save user with all attributes" do
    user = User.new(
      email: "alicemendes@email.com",
      password: "djeiow",
      password_confirmation: "djeiow",
      nickname: "User", 
      description: "Description user"
    )
    assert user.save, "Could not save the user with all atributes"
  end

  #Teste para cadastro de user comm nickname inválido
  test "should not save user with an invalid nickname" do
    user = User.new(
      email: "alicemendes@email.com",
      password: "djeiow",
      password_confirmation: "djeiow",
      nickname: 64653,
      description: "Description user"
    )
    assert user.save, "Saved the user with an invalid nickname"
  end

  #Teste para cadastro de user com tamanho de nickname inválido
  test "should not save user with invalid nickname length" do
    user = User.new(
      email: "alicemendes@email.com",
      password: "djeiow",
      password_confirmation: "djeiow",
      nickname: "ab", 
      description: "Description user"
    )
    assert user.save, "Saved the user with an invalid nickname length"
  end

  #Teste para cadastro de user com descrição inválida
  test "should not save user without description" do
    user = User.new(
      email: "alicemendes@email.com",
      password: "djeiow",
      password_confirmation: "djeiow",
      nickname: "UserNickname",
      description: "     "
    )
    refute user.save, "Saved the user without an invalid description"
  end

end

