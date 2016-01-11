json.array!(@duties) do |duty|
  json.extract! duty, :id, :date, :time, :name
  json.url duty_url(duty, format: :json)
end
