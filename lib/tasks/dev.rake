namespace :dev do
  desc "Setup Development"
  task setup: :environment do

  	puts "Executando o setup para desenvolvimento..."

  	puts "APAGANDO BD... #{%x(rails db:drop)}"
    puts "CRIANDO BD... #{%x(rails db:create)}"
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
    puts %x(rails dev:generate_contacts)
    puts %x(rails dev:generate_address)
    puts %x(rails dev:generate_preferences)
    puts %x(rails dev:generate_contact_preferences)
    puts %x(rails dev:generate_contact_phones)
    puts %x(rails dev:generate_contact_images)

    puts "Setup executado com sucesso!"
  end

  ###################################################################################

  desc "Cria Contatos Fake"
  task generate_contacts: :environment do
    puts "Cadastrando Contados..."

    10.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birth_date: Faker::Date.between(50.years.ago, 20.years.ago),
        gender: [0,1].sample
      )
    end
    
    puts "Contados cadastrados com sucesso!."
  end

  ###################################################################################

  desc "Cria endereços para contados Fake"
  task generate_address: :environment do
    puts "Cadastrando ENDEREÇOS para os contatos..."

    Contact.all.each do |c|
      c.build_address(
        zip_code: Faker::Address.postcode,
        street: Faker::Address.street_address,
        state: State.all.sample.name
      )
      state = State.find_by(name: c.address.state)
      c.address.city = City.where("state_id = ?", state.id).sample.name
      c.save! 
    end
    
    puts "Endereços dos contatos cadastrados com sucesso!."
  end

  ###################################################################################

  desc "Cria Preferências"
  task generate_preferences: :environment do
  	puts "Cadastrando Preferências..."

    preferences = %w(jogos cinema televisão internet tecnologia esportes livros)

		preferences.each do |p|
      Preference.create!(
        name: p
      )
    end
  	
  	puts "Preferências cadastradas com sucesso."
  end

  #####################################################################################

  desc "Cria Preferências para contatos Fake"
  task generate_contact_preferences: :environment do
    puts "Cadastrando Preferências dos contatos..."

    Contact.all.each do |c|
      Preference.all.sample(Random.rand(3)).each do |p|
        c.preferences << p
      end
    end

    puts "Preferências dos contatos cadastradas com sucesso!."
  end

  #####################################################################################

  desc "Cria Telefones para contatos Fake"
  task generate_contact_phones: :environment do
    puts "Cadastrando Telefones dos contatos..."

    Contact.all.each do |c|
      Random.rand(1..3).times do
        Phone.create!(
          number: Faker::PhoneNumber.phone_number,
          contact: c
        )
      end
    end

    puts "Telefones dos contatos cadastradas com sucesso!."
  end

  #####################################################################################

  desc "Cria Imagens para contatos Fake"
  task generate_contact_images: :environment do
  	puts "Cadastrando Telefones dos contatos..."

	 	Contact.all.each do |c|
  		c.picture = File.new(Rails.root.join('public', 'images-for-contacts', "#{Random.rand(1..7)}.jpg"), 'r')
      c.save!
  	end

  	puts "Imagens dos contatos cadastradas com sucesso!."
  end

end
