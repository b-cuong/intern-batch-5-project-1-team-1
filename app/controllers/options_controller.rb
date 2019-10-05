class OptionsController < ApplicationController
  before_action :set_option, except: [:index, :new, :create]

  def index
    @options = Option.all
  end

  def show; end

  def new
    @option = Option.new
  end

  def edit; end

  def create
    @option = Option.new option_params
    respond_to do |format|
      if @option.save
        format.html { redirect_to options_path, notice: t(".option_succs") }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @option.update option_params
        format.html { redirect_to @option, notice: t(".option_succs") }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: t(".option_succs") }
    end
  end

  private

  def set_option
    @option = Option.find params[:id]
  end

  def option_params
    params.require(:option).permit(:content, :score)
  end
end
