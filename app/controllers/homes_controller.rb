class HomesController < ApplicationController
  def test
    @options = Option.all
    @result = Result.new
    @characters = Character.includes(:questions).all
    @characters = Character.paginate(page: params[:page])
  end
end
