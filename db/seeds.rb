require 'net/http'
require 'json'

breed_url = URI("https://dog.ceo/api/breeds/list/all")
response = Net::HTTP.get(breed_url)
breeds_data = JSON.parse(response)

if breeds_data['status'] == 'success'
  breeds_data['message'].each do |breed_name, sub_breeds|
    breed = Breed.create(name: breed_name)

    sub_breeds.each do |sub_breed_name|
      breed.sub_breeds.create(name: sub_breed_name)
    end
  end
end

Dog.destroy_all

desired_dogs_count = 200
actual_dogs_count = 0

while actual_dogs_count < desired_dogs_count
  random_breed = Breed.order("RANDOM()").first
  random_sub_breed = random_breed.sub_breeds.order("RANDOM()").first if random_breed.sub_breeds.any?

  dog_url = URI("https://dog.ceo/api/breeds/image/random#{"/#{random_sub_breed.name}" if random_sub_breed}")
  dog_response = Net::HTTP.get(dog_url)
  dog_data = JSON.parse(dog_response)

  if dog_data['status'] == 'success'
    Dog.create(image_url: dog_data['message'], sub_breed: random_sub_breed)
    actual_dogs_count += 1
  end
end
