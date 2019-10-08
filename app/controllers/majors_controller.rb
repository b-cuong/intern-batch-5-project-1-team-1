class MajorsController < ApplicationController
  before_action :set_major, except: [:index, :new, :create]

  def index
    @majors = Major.includes(:characters).all
  end

  def show; end

  def new
    @major = Major.new
    @major_character = @major.characters.build
  end

  def edit; end

  def create
    @major = Major.new major_params
    params[:major][:character_ids].each do |character_id|
      @major.character_majors.build(character_id: character_id) unless character_id.empty?
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
        @major.characters = []
        params[:major][:character_ids].each do |character_id|
          @major.characters << Character.find(character_id) unless character_id.empty?
        end
        format.html { redirect_to @major, notice: t(".majors_succs") }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @character_majors = set_major.character_majors
    @character_majors.each(&:destroy)
    @major.destroy
    respond_to do |format|
      format.html { redirect_to majors_url, notice: t(".majors_succs") }
    end
  end

  private

  def set_major
    @major = Major.find params[:id]
  end

  def major_params
    params.require(:major).permit(:name, :description)
  end
end
