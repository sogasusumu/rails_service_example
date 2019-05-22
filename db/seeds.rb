# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_attributes = [
    { first_name: 'user', last_name: 'one' },
    { first_name: 'user', last_name: 'two' }
]

users = user_attributes.map { |attr| User.create(attr) }

company_attributes = [
    { name: 'company_one' },
    { name: 'company_two' }
]

company_attributes.each do |company_attribute|
  company = Company.create(company_attribute)
  clients = []
  3.times do |i|
    first_name = %W[first_name #{i} #{company.name}].join('_')
    last_name = %W[last_name #{i} #{company.name}].join('_')
    email = %W[client #{i}].join('_') << "@#{company.name}.com"
    clients << company.clients.create(first_name: first_name, last_name: last_name, email: email)
  end

  users.each { |user| ChatRoom.create(company_id: company.id, user_id: user.id) }

  users.each do |user|
    user.chat_rooms.each do |chat_room|
      chat_room.user_messages.create(body: "hello i am #{user.first_name} #{user.last_name}.")
    end
  end

  clients.each do |client|
    client.company.chat_rooms.each do |chat_room|
      chat_room.client_messages.create(body: "hello i am #{client.first_name}.", client_id: client.id)
    end
  end
end
