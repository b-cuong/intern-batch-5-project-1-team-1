class QuestionsController < ApplicationController
  before_action :set_question, except: [:index, :new, :create]

  def index
    @questions = Question.includes(:character).all
  end

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new question_params
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: t(".questions_succs") }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update question_params
        format.html { redirect_to @question, notice: t(".questions_succs") }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: t(".questions_succs") }
    end
  end

  private

  def set_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:content, :character_id)
  end
end
