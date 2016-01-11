json.duties do |json|
  json.array!(@duties) do |duty|
    json.extract! duty, :id, :date, :time, :name
  end
end
