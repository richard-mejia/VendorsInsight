json.array!(@telas) do |tela|
  json.extract! tela, :id, :tipo_tela
  json.url tela_url(tela, format: :json)
end
