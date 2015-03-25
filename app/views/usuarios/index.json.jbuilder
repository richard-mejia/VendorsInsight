json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :apellido, :cedula, :clave, :correo, :tipo_usuario
  json.url usuario_url(usuario, format: :json)
end
