require 'test_helper'

class UsedIngredientsControllerTest < ActionController::TestCase
  setup do
    @used_ingredient = used_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:used_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create used_ingredient" do
    assert_difference('UsedIngredient.count') do
      post :create, used_ingredient: @used_ingredient.attributes
    end

    assert_redirected_to used_ingredient_path(assigns(:used_ingredient))
  end

  test "should show used_ingredient" do
    get :show, id: @used_ingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @used_ingredient.to_param
    assert_response :success
  end

  test "should update used_ingredient" do
    put :update, id: @used_ingredient.to_param, used_ingredient: @used_ingredient.attributes
    assert_redirected_to used_ingredient_path(assigns(:used_ingredient))
  end

  test "should destroy used_ingredient" do
    assert_difference('UsedIngredient.count', -1) do
      delete :destroy, id: @used_ingredient.to_param
    end

    assert_redirected_to used_ingredients_path
  end
end
