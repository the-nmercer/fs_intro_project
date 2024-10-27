require 'net/http'
require 'json'
require 'uri'
require 'faker'

def fetch_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

breeds_response = fetch_data('https://dog.ceo/api/breeds/list/all')
breeds = breeds_response['message']

Dog.destroy_all
Owner.destroy_all

dog_images = []
random_breeds = breeds.keys.shuffle

random_breeds.each do |breed|
  image_response = fetch_data("https://dog.ceo/api/breed/#{breed}/images/random")

  owner_name = Faker::Name.name
  owner = Owner.create(name: owner_name)

  dog_images << {
    breed: breed,
    image_url: image_response['message'],
    sub_breed: breeds[breed].sample || '',
    owner: owner
  }

  break if dog_images.size >= 200
end

dog_images.each do |dog_data|
  sub_breed = SubBreed.find_or_create_by(name: dog_data[:sub_breed]) unless dog_data[:sub_breed].blank?
  Dog.create(breed: dog_data[:breed], image_url: dog_data[:image_url], sub_breed: sub_breed, owner: dog_data[:owner])
end

puts "Seeded #{Dog.count} dogs and #{Owner.count} owners."
