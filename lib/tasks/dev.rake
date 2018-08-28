namespace :dev do
  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do

  	show_spinner("APAGANDO BD..."){ %x(rails db:drop)}
    show_spinner("CRIANDO BD..."){ %x(rails db:create)}
    show_spinner("MIGRANDO BD..."){ %x(rails db:migrate)}
    show_spinner("EXECUTANDO db:seed ..."){ %x(rails db:seed)}
    show_spinner("Cadastrando Contados..."){%x(rails dev:generate_contacts)}
    show_spinner("Cadastrando Endereços para os contatos..."){%x(rails dev:generate_address)}
    show_spinner("Cadastrando Preferências...") {%x(rails dev:generate_preferences)}
    show_spinner("Cadastrando Preferências dos Contatos...") {%x(rails dev:generate_contact_preferences)}
    show_spinner("Cadastrando Telefones dos Contatos..."){%x(rails dev:generate_contact_phones)}
    show_spinner("Cadastrando Imagens dos Contatos") {%x(rails dev:generate_contact_images)}

  end

  ###################################################################################

  desc "Cria Contatos Fake"
  task generate_contacts: :environment do

    10.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birth_date: Faker::Date.between(50.years.ago, 20.years.ago),
        gender: [0,1].sample
      )
    end
    
  end

  ###################################################################################

  desc "Cria endereços para contados Fake"
  task generate_address: :environment do

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
  
  end

  ###################################################################################

  desc "Cria Preferências"
  task generate_preferences: :environment do

    preferences = %w(jogos cinema televisão internet tecnologia esportes livros)

		preferences.each do |p|
      Preference.create!(
        name: p
      )
    end
  	
  end

  #####################################################################################

  desc "Cria Preferências para contatos Fake"
  task generate_contact_preferences: :environment do

    Contact.all.each do |c|
      Preference.all.sample(Random.rand(3)).each do |p|
        c.preferences << p
      end
    end

  end

  #####################################################################################

  desc "Cria Telefones para contatos Fake"
  task generate_contact_phones: :environment do

    Contact.all.each do |c|
      Random.rand(1..3).times do
        Phone.create!(
          number: Faker::PhoneNumber.phone_number,
          contact: c
        )
      end
    end

  end

  #####################################################################################

  desc "Cria Imagens para contatos Fake"
  task generate_contact_images: :environment do

	 	Contact.all.each do |c|
  		c.picture = File.new(Rails.root.join('public', 'images-for-contacts', "#{Random.rand(1..7)}.jpg"), 'r')
      c.save!
  	end

  end

  private

    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end

end
