class TestingsController < ApplicationController
  before_filter :load_instance
  before_filter :authenticate_user!

  def show
    @question = @testing.questions.first
  end

  def next
    @answer = Answer.find(params[:answer_id])
    @correct = @answer.correct?
    @question = @answer.question.next
    current_user.user_questions.create(:question_id => @answer.question.id, 
                                      :answer_id => params[:answer_id],
                                      :correct => @correct)
    if @question 
      render :show
    else
      current_user.user_testings.create(:testing_id => @testing.id, :passed => true)
      redirect_to [:results, @course, @lesson, @testing], notice: "Test was successfully finished"
    end
  end

  def results
  end

  def load_instance
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @testing = Testing.find(params[:id])
  end

end
