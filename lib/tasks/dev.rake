namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)

    p "Cadastrando os tipos de contatos"
      kinds = %w[Amigo Comercial Conhecido]
      kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    p "Tipos de contatos cadastrados"

    p "Cadastrando os contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: "2000-01-01", to: Date.today),
        kind_id: 1,
        address: nil
      )
    end
    p "Contatos cadastrados"

    p "Cadastrando os telefones"
      Contact.all.each do |contact|
        Random.rand(5).times do |i|
          phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
          contact.phones << phone
          contact.save!
      end
    end
    p "Telefones cadastrados"

    p "Cadastrando os endereços"
    Contact.all.each do |contact|
          Address.create!(
          street: Faker::Address.street_address,
          city:  Faker::Address.city,
          contact: contact
        )
    end
    p "Endereços cadastrados"
  end
end
