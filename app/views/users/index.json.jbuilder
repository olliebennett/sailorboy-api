json.users do |json|
  json.array!(@users) do |user|
    json.extract! user, :id, :name
  end
end
