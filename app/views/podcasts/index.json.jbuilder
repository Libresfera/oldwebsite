json.array!(@podcasts) do |podcast|
  json.extract! podcast, :id, :title, :description, :thumbnail, :audio
  json.url podcast_url(podcast, format: :json)
end
