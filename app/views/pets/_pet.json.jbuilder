json.extract! pet, :id, :name, :specie, :weight, :height, :created_at, :updated_at
json.url pet_url(pet, format: :json)
