# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy database.."
sleep(1)
Category.destroy_all
Task.destroy_all
Email.destroy_all

sleep(1)
puts "Reset PK Sequence"
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
ActiveRecord::Base.connection.reset_pk_sequence!('tasks')
ActiveRecord::Base.connection.reset_pk_sequence!('emails')
puts "Sucess, all DB deleted"
sleep(1)
puts "Generate new DB..."
puts ""
puts ""
sleep(2)
puts "ALL GOOD, DB fresh and ready to be explored like as life"

require 'faker'
3.times do
  my_category = Category.create(title: Faker::Book.genre)
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward(23),
                      image: Faker::Avatar.image)
    my_task.category = my_category
    my_task.save
  end
end


  8.times do
    email = Email.create(object: Faker::Book.title, body: Faker::MichaelScott.quote)

  end