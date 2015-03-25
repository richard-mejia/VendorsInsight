json.array!(@solicituds) do |solicitud|
  json.extract! solicitud, :id, :fecha, :vendedor_id, :cliente, :disenador_id, :linea, :tipo, :set_tallas, :contramuestra, :referencia, :talla, :muestra_tela, :nombre_tela, :adjunto, :cantidad, :especificacion
  json.url solicitud_url(solicitud, format: :json)
end
