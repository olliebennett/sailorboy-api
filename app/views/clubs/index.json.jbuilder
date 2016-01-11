json.clubs do |json|
  json.array!(@clubs) do |club|
    json.extract! club, :id, :name
  end
end
