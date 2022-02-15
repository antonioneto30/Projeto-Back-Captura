require 'test_helper'

class ProjetosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projeto = projetos(:one)
  end

  test "should get index" do
    get projetos_url, as: :json
    assert_response :success
  end

  test "should create projeto" do
    assert_difference('Projeto.count') do
      post projetos_url, params: { projeto: { name: @projeto.name } }, as: :json
    end

    assert_response 201
  end

  test "should show projeto" do
    get projeto_url(@projeto), as: :json
    assert_response :success
  end

  test "should update projeto" do
    patch projeto_url(@projeto), params: { projeto: { name: @projeto.name } }, as: :json
    assert_response 200
  end

  test "should destroy projeto" do
    assert_difference('Projeto.count', -1) do
      delete projeto_url(@projeto), as: :json
    end

    assert_response 204
  end
end
