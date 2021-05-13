require 'faker'

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    description: Faker::Quotes::Shakespeare.hamlet_quote, 
    email: Faker::Internet.email, 
    age: Faker::Number.within(range: 18..70),
    city_id: Faker::Number.within(range: 1..10),
    password: "123456")
end

10.times do 
  city = City.create!(name: 
    Faker::Address.city, 
    user_id: Faker::Number.within(range: 1..10))
    
end

20.times do 
  gossip = Gossip.create!(
    title: Faker::Games::Overwatch.hero, 
    content: Faker::Games::Overwatch.quote,user_id: 
    Faker::Number.within(range: 1..10))
end

10.times do
  tag = Tag.create!(
    title: Faker::Superhero.power)
end

10.times do
  cloud = Cloud.create!(
    name: Faker::Movies::HarryPotter.house, 
    gossip_id: Faker::Number.within(range: 1..10), 
    tag_id: Faker::Number.within(range: 1..10))
end

20.times do 
  comments = Comment.create!(content: Faker::Quote.jack_handey,
    user_id: Faker::Number.within(range:1..10),
    gossip_id: Faker::Number.within(range:1..20))
end

10.times do 
  pm = PrivateMessage.create!(
    content: Faker::Movies::StarWars.quote, 
    sender_id: Faker::Number.within(range: 1..10), 
    recipient_id: Faker::Number.within(range: 1..10))
end

100.times do    
  likes = Like.create!(comment_id: Faker::Number.within(range:1..20), gossip_id: Faker::Number.within(range:1..20), user_id: Faker::Number.within(range:1..10)) 

end
