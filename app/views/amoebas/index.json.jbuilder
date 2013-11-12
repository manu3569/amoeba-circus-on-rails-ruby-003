json.array!(@amoebas) do |amoeba|
  json.extract! amoeba, :name, :generation, :talent_id
  json.url amoeba_url(amoeba, format: :json)
end
