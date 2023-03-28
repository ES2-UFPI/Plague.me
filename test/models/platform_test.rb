require "test_helper"

class PlatformTest < ActiveSupport::TestCase

    #Teste para cadastro de platform com todos os atributos
    test "should save platform with all attributes" do
      platform = Platform.new(
        name_platform: "Platform1", 
        description_platform: "Description platform"
      )
      assert platform.save, "Could not save the platform with all atributes"
    end
  
    #Teste para cadastro de platform com nome inválido
    test "should save platform with an invalid name" do
      platform = Platform.new(
        name_platform: "   ", 
        description_platform: "Description platform"
      )
      refute platform.save, "Saved the platform with an invalid name"
    end
  
    #Teste para cadastro de platform com descrição inválido
    test "should save platform with an invalid description" do
      platform = Platform.new(
        name_platform: "Platform1", 
        description_platform: "   "
      )
      refute platform.save, "Saved the platform with an invalid description"
    end

end
