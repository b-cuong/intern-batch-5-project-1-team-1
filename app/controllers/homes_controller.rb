class HomesController < ApplicationController
  def index
    @options = Option.all
    @result = Result.new
    @characters = Character.includes(:questions).all
    @characters = Character.paginate(page: params[:page])
  end

  def create
    lastResult = Result.where(user_id: current_user.id).last
    batch = lastResult ? lastResult.batch + 1 : 1
    user_id = current_user.id
    Result.transaction do
      result_params.each do |character_id, hash|
        hash.each do |question_id, option_id|
          @result = Result.new
          @result.question_id = question_id
          @result.option_id = option_id
          @result.character_id = character_id
          @result.user_id = user_id
          @result.batch = batch
          @result.save!
        end
      end
    end
    redirect_to home_path(id: batch)
  end

  def show
    @characters = Character.includes(:majors).all
    batch = batch_params
    @results = Result.select("results.character_id", "sum(options.score) as sum_score")
                     .joins(:option)
                     .includes(character: :majors)
                     .where(user_id: current_user.id)
                     .where(batch: batch)
                     .group(:character_id)
                     .order(sum_score: :desc)
    @maxs = @results.max_by { |_character_id, sum_score| sum_score }
  end

  private

  def batch_params
    params.require(:id)
  end

  def result_params
    params.require(:result)
  end
end
