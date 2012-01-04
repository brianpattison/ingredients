class UsedIngredientsController < ApplicationController
  before_filter :authenticate
  # GET /used_ingredients
  # GET /used_ingredients.json
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredients = UsedIngredient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @used_ingredients }
    end
  end

  # GET /used_ingredients/1
  # GET /used_ingredients/1.json
  def show
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredient = UsedIngredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @used_ingredient }
    end
  end

  # GET /used_ingredients/new
  # GET /used_ingredients/new.json
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredient = UsedIngredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @used_ingredient }
    end
  end

  # GET /used_ingredients/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredient = UsedIngredient.find(params[:id])
  end

  # POST /used_ingredients
  # POST /used_ingredients.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredient = UsedIngredient.new(params[:used_ingredient])
    @used_ingredient.recipe = @recipe

    respond_to do |format|
      if @used_ingredient.save
        format.html { redirect_to @recipe, notice: 'Ingredient was successfully added.' }
        format.json { render json: @used_ingredient, status: :created, location: @used_ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @used_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /used_ingredients/1
  # PUT /used_ingredients/1.json
  def update
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredient = UsedIngredient.find(params[:id])

    respond_to do |format|
      if @used_ingredient.update_attributes(params[:used_ingredient])
        format.html { redirect_to @recipe, notice: 'Ingredient was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @used_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /used_ingredients/1
  # DELETE /used_ingredients/1.json
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @used_ingredient = UsedIngredient.find(params[:id])
    @used_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to @recipe }
      format.json { head :ok }
    end
  end
end
