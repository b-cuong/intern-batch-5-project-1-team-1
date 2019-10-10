class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @user = User.all
  end

  def show
    @characters = Character.includes(:majors).all
    @results = Result.select("results.batch as luot", "results.character_id", "sum(options.score) as sum_score")
                     .joins(:option)
                     .includes(character: :majors)
                     .where(user_id: current_user.id)
                     .group(:batch)
                     .group(:character_id)
    @maxs = @results.max_by { |luot, character_id, sum_score| sum_score }
  end

  def new
    redirect_to homes_path if logged_in?
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    return render :new unless @user.save

    log_in @user
    redirect_to homes_path
  end

  def update
    respond_to do |format|
      if @user.update user_params
        format.html { redirect_to @user, notice: t(".CM") }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t(".delete") }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:full_name, :gender, :dob, :email, :phone, :address, :password)
  end
end
