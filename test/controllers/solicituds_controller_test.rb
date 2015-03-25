require 'test_helper'

class SolicitudsControllerTest < ActionController::TestCase
  setup do
    @solicitud = solicituds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicituds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitud" do
    assert_difference('Solicitud.count') do
      post :create, solicitud: { adjunto: @solicitud.adjunto, cantidad: @solicitud.cantidad, cliente: @solicitud.cliente, contramuestra: @solicitud.contramuestra, disenador_id: @solicitud.disenador_id, especificacion: @solicitud.especificacion, fecha: @solicitud.fecha, linea: @solicitud.linea, muestra_tela: @solicitud.muestra_tela, nombre_tela: @solicitud.nombre_tela, referencia: @solicitud.referencia, set_tallas: @solicitud.set_tallas, talla: @solicitud.talla, tipo: @solicitud.tipo, vendedor_id: @solicitud.vendedor_id }
    end

    assert_redirected_to solicitud_path(assigns(:solicitud))
  end

  test "should show solicitud" do
    get :show, id: @solicitud
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solicitud
    assert_response :success
  end

  test "should update solicitud" do
    patch :update, id: @solicitud, solicitud: { adjunto: @solicitud.adjunto, cantidad: @solicitud.cantidad, cliente: @solicitud.cliente, contramuestra: @solicitud.contramuestra, disenador_id: @solicitud.disenador_id, especificacion: @solicitud.especificacion, fecha: @solicitud.fecha, linea: @solicitud.linea, muestra_tela: @solicitud.muestra_tela, nombre_tela: @solicitud.nombre_tela, referencia: @solicitud.referencia, set_tallas: @solicitud.set_tallas, talla: @solicitud.talla, tipo: @solicitud.tipo, vendedor_id: @solicitud.vendedor_id }
    assert_redirected_to solicitud_path(assigns(:solicitud))
  end

  test "should destroy solicitud" do
    assert_difference('Solicitud.count', -1) do
      delete :destroy, id: @solicitud
    end

    assert_redirected_to solicituds_path
  end
end
