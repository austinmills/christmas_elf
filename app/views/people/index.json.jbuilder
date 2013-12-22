json.array!(@people) do |person|
  json.extract! person, :id, :name, :gifts, :quickies, :smfls, :opened
  json.url person_url(person, format: :json)
end
