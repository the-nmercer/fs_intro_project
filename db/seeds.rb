require 'net/http'
require 'json'
require 'uri'

def fetch_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

breeds_response = fetch_data('https://dog.ceo/api/breeds/list/all')
breeds = breeds_response['message']

Dog.destroy_all

dog_images = []
breeds.each do |breed, sub_breeds|
  image_response = fetch_data("https://dog.ceo/api/breed/#{breed}/images/random")

  dog_images << {
    breed: breed,
    image_url: image_response['message'],
    sub_breed: sub_breeds.sample || ''
  }

  break if dog_images.size >= 10
end

dog_images.each do |dog_data|
  sub_breed = SubBreed.find_or_create_by(name: dog_data[:sub_breed]) unless dog_data[:sub_breed].blank?
  Dog.create(breed: dog_data[:breed], image_url: dog_data[:image_url], sub_breed: sub_breed)
end

puts "Seeded #{Dog.count} dogs."
