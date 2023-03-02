require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #Teste para cadastro de user com todos os atributos
  test "should save user with all attributes" do
    user = User.new(
      nickname: "User1", 
      description: "Description user"
    )
    assert user.save, "Could not save the user with all atributes"
  end

  #Teste para cadastro de user comm nickname inválido
  test "should not save user without nickname" do
    user = User.new(
      nickname: "$6-292",
      description: "Description user"
    )
    refute user.save, "Saved the user without an invalid nickname"
  end

  #Teste para cadastro de user com tamanho de nickname inválido
  test "should not save user with invalid nickname length" do
    user = User.new(
      nickname: "ab", 
      description: "Description user"
    )
    refute user.save, "Saved the user with an invalid nickname length"
  end

  #Teste para cadastro de user com descrição inválida
  test "should not save user without description" do
    user = User.new(
      nickname: "UserNickname",
      description: "     "
    )
    refute user.save, "Saved the user without an invalid description"
  end

end

