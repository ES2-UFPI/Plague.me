namespace :dev do

    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        
        puts("Apagando BD...") 
        %x(rails db:drop:_unsafe)

        puts("Criando o BD...") 
        %x(rails db:create)
         
        puts("Migrando o BD...")
        %x(rails db:migrate)
        
        %x(rails dev:add_genres)
        puts("Gêneros cadastrados!")

        %x(rails dev:add_platforms)
        puts("Plataformas cadastradas!")

        %x(rails dev:add_publishers)
        puts("Publishers cadastradas!")

        %x(rails dev:add_developers)
        puts("Desenvolvedores cadastrados!")

        %x(rails dev:add_games) 
        puts("Jogos cadastrados!") 

        %x(rails dev:add_default_user) 
        puts("Usuários padrão cadastrados!")
         
      else
        puts "Not on development env"
      end
      
    end


    desc "Cadastra os gêneros"
    task add_genres: :environment do  

      genres = [

            { name_genre: "Ação",
              description_genre: "Desafia a velocidade, reflexo e raciocínio rápido do jogador." },
            
            { name_genre: "Aventura",
              description_genre: "Focado no enredo e não na ação. Explore e descubra!" },
            
            { name_genre: "RPG",
              description_genre: "Controle as ações de um ou mais personagens imersos nos mais variados mundos." },
            
            { name_genre: "Simulação",
              description_genre: "Testa e desenvolve as habilidades de construção e gerenciamento do jogador." },
            
            { name_genre: "Estratégia",
              description_genre: "Demonstre suas habilidades de pensamento e planejamento para alcançar a vitória." }
      ]
      
        genres.each do |genre|
          Genre.find_or_create_by!(genre)
        end
    end


    desc "Cadastra as plataformas"
    task add_platforms: :environment do  

      platforms = [

            { name_platform: "Steam",
              description_platform: "Criada pela Valve Corporation." },
            
            { name_platform: "Epic Games",
              description_platform: "Fundada por Tim Sweeney." },
            
            { name_platform: "G2A",
              description_platform: "Fundada por Bartosz Skwarczek e Dawid Rożek." }
      ]
      
        platforms.each do |platform|
          Platform.find_or_create_by!(platform)
        end
    end


    desc "Cadastra publishers"
    task add_publishers: :environment do  

      publishers = [

        { name_publisher: "CAPCOM",
          description_publisher: "Desenvolvedora e publicadora japonesa de jogos eletrônicos sediada em Osaka." },
          
        { name_publisher: "Coffee Stain Studios",
          description_publisher: "Desenvolvedora e publicadora de jogos independentes da Suécia" },
          
        { name_publisher: "Bethesda Softworks",
          description_publisher: "É um braço de publicação da Bethesda norte-americano de jogos eletrônicos sediada em Rockville, Maryland." },

        { name_publisher: "Xbox Game Studios",
          description_publisher: "Divisão multinacional da Microsoft responsável por produzir e distribuir jogos eletrônicos." },

        { name_publisher: "Konami",
          description_publisher: "Empresa pública japonesa desenvolvedora e distribuidora de jogos eletrônicos." }
      ]
      
        publishers.each do |publisher|
          Publisher.find_or_create_by!(publisher)
        end
    end


    desc "Cadastra desenvolvedores"
    task add_developers: :environment do  

      developers = [

            { name_developer: "CAPCOM",
              description_developer: "Desenvolvedora e publicadora japonesa de jogos eletrônicos sediada em Osaka." },
            
            { name_developer: "Iron Gate",
              description_developer: "Desenvolvedora independente de jogos eletrônicos com sede em Skövde, Suécia." },
            
            { name_developer: "Bethesda Game Studios",
              description_developer: "Desenvolvedora norte-americana de jogos eletrônicos sediada em Rockville, Maryland." },

            { name_developer: "Playground Games",
              description_developer: "Empresa de desenvolvimento de jogos eletrônicos canadense." },
            
            { name_developer: "Konami Digital Entertainment",
              description_developer: "É uma empresa pública japonesa desenvolvedora e distribuidora de jogos eletrônicos." }
      ]
      
        developers.each do |developer|
          Developer.find_or_create_by!(developer)
        end
    end


    desc "Cadastra jogos"
    task add_games: :environment do  

      games = [

        { name_game: "Monster Hunter: World",
          description_game: "Monster Hunter: World",
          rate_game: 10,
          franchise: "Monster Hunter",
          genre_ids: [Genre.find_by(name_genre: 'Ação').id, Genre.find_by(name_genre: 'Aventura').id],
          platform_ids: [Platform.find_by(name_platform: 'Steam').id],
          publisher: Publisher.find_by(name_publisher: 'CAPCOM'),
          developer: Developer.find_by(name_developer: 'CAPCOM') },
          
        { name_game: "Valheim",
          description_game: "Valheim",
          rate_game: 10,
          franchise: "Valheim",
          genre_ids: [Genre.find_by(name_genre: 'Aventura').id, Genre.find_by(name_genre: 'Ação').id],
          platform_ids: [Platform.find_by(name_platform: 'Steam').id, Platform.find_by(name_platform: 'G2A').id],
          publisher: Publisher.find_by(name_publisher: 'Coffee Stain Studios'),
          developer: Developer.find_by(name_developer: 'Iron Gate') },
          
        { name_game: "The Elder Scrolls V: Skyrim Special Edition",
          description_game: "The Elder Scrolls V: Skyrim Special Edition",
          rate_game: 10,
          franchise: "The Elder Scrolls",
          genre_ids: [Genre.find_by(name_genre: 'RPG').id, Genre.find_by(name_genre: 'Aventura').id],
          platform_ids: [Platform.find_by(name_platform: 'Steam').id, Platform.find_by(name_platform: 'Epic Games').id],
          publisher: Publisher.find_by(name_publisher: 'Bethesda Softworks'),
          developer: Developer.find_by(name_developer: 'Bethesda Game Studios') },

        { name_game: "Forza Horizon 5",
          description_game: "Forza Horizon 5",
          rate_game: 10,
          franchise: "Forza",
          genre_ids: [Genre.find_by(name_genre: 'Simulação').id, Genre.find_by(name_genre: 'Aventura').id],
          platform_ids: [Platform.find_by(name_platform: 'Steam').id],
          publisher: Publisher.find_by(name_publisher: 'Xbox Game Studios'),
          developer: Developer.find_by(name_developer: 'Playground Games') },

        { name_game: "Yu-Gi-Oh! Master Duel",
          description_game: "Yu-Gi-Oh! Master Duel",
          rate_game: 10,
          franchise: "Yu-Gi-Oh!",
          genre_ids: [Genre.find_by(name_genre: 'Estratégia').id],
          platform_ids: [Platform.find_by(name_platform: 'Steam').id],
          publisher: Publisher.find_by(name_publisher: 'Konami'),
          developer: Developer.find_by(name_developer: 'Konami Digital Entertainment') }
      ]
      
        games.each do |game|
          Game.create_with(game.except(:genre_ids)).find_or_create_by!(game.slice(:name_game)).tap do |g|
              g.genre_ids = game[:genre_ids]
              g.platform_ids = game[:platform_ids]
            end
        end
    end

    desc "Cadastra usuários"
    task add_default_user: :environment do  

        User.create!(
          email: 'user@user.com',
          password: 123456,
          password_confirmation: 123456,
          nickname: 'defuser',
          admin: false
        )

        User.create!(
          email: 'test@test.com',
          password: 123456,
          password_confirmation: 123456,
          nickname: 'usertest',
          admin: false
        )
        
    end

end