require "test_helper"

class PublisherTest < ActiveSupport::TestCase

    #Teste para cadastro de publisher com todos os atributos
    test "should save publisher with all attributes" do
        publisher = Publisher.new(
          name_publisher: "publisher1", 
          description_publisher: "Description publisher"
        )
        assert publisher.save, "Could not save the publisher with all atributes"
      end
    
      #Teste para cadastro de publisher com nome inválido
      test "should save publisher with an invalid name" do
        publisher = Publisher.new(
          name_publisher: "   ", 
          description_publisher: "Description publisher"
        )
        refute publisher.save, "Saved the publisher with an invalid name"
      end
    
      #Teste para cadastro de publisher com descrição inválido
      test "should save publisher with an invalid description" do
        publisher = Publisher.new(
          name_publisher: "publisher1", 
          description_publisher: "   "
        )
        refute publisher.save, "Saved the publisher with an invalid description"
      end

end
