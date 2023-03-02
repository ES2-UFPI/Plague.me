require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase

  #Teste para cadastro de developers com todos os atributos
  test "should save developer with all attributes" do
    developer = Developer.new(
      name_developer: "Developer1", 
      description_developer: "Description developer"
    )
    assert developer.save, "Could not save the developer with all atributes"
  end

  #Teste para cadastro de developers com nome inválido
  test "should save developer with an invalid name" do
    developer = Developer.new(
      name_developer: "   ", 
      description_developer: "Description developer"
    )
    refute developer.save, "Saved the developer with an invalid name"
  end

  #Teste para cadastro de developers com uma descrição inválida
  test "should save developer with an invalid description" do
    developer = Developer.new(
      name_developer: "Developer1", 
      description_developer: "   "
    )
    refute developer.save, "Saved the developer with an invalid description"
  end

end
