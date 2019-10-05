class MajorsController < ApplicationController
  before_action :set_major, except: [:index, :new, :create]

  def index
    @majors = Major.all.includes(:characters)
  end

  def show; end

  def new
    @major = Major.new
    @major_character = @major.characters.build
  end

  def edit; end

  def create
    @major = Major.new(major_params)
    params[:characters][:id].each do |character|
      @major.character_majors.build(character_id: character) unless character.empty?
    end

    respond_to do |format|
      if @major.save
        format.html { redirect_to @major, notice: t(".majors_succs") }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @major.update(major_params)
        format.html { redirect_to @major, notice: t(".majors_succs") }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @major.destroy
    respond_to do |format|
      format.html { redirect_to majors_url, notice: t(".majors_succs") }
    end
  end

  private

  def set_major
    @major = Major.find(params[:id])
  end

  def major_params
    params.require(:major).permit(:name, :description)
  end
end
