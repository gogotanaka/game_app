json.array!(@tagsds) do |tagsd|
  json.extract! tagsd, :id
  json.url tagsd_url(tagsd, format: :json)
end
