class CharactersController < ApplicationController
  before_action :set_character, except: [:index, :new, :create]

  def index
    @characters = Character.all
  end

  def show; end

  def new
    @character = Character.new
  end

  def edit; end

  def create
    @character = Character.new character_params
    respond_to do |format|
      if @character.save
        format.html { redirect_to characters_path, notice: t(".character_succs") }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update character_params
        format.html { redirect_to @character, notice: t(".character_succs") }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: t(".character_succs") }
    end
  end

  private

  def set_character
    @character = Character.find params[:id]
  end

  def character_params
    params.require(:character).permit(:name, :description)
  end
end
