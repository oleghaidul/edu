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
                                      :correct => @correct,
                                      :testing_id => @testing.id)
    cur_test = current_user.user_questions.where(:testing_id => @testing.id)
    procent = cur_test.where(:correct => true).count * 100 / cur_test.count
    if procent > 80
      passed = true
    else
      passed = false
    end

    if @question 
      render :show
    else
      current_user.user_testings.create(:testing_id => @testing.id, 
                                        :passed => passed, 
                                        :course_id => @course.id,
                                        :lesson_id => @lesson.id,
                                        :procent => procent)
      u_tests = current_user.user_testings.where(:lesson_id => @lesson.id)
      if u_tests.where(:passed => true).count == u_tests.count
        lesson_passed = true
      else
        lesson_passed = false
      end
      current_user.user_lessons.create(:lesson_id => @lesson.id, 
                                       :course_id => @course.id,
                                       :passed => lesson_passed)
      if current_user.user_lessons.where(:passed => true).count == @course.lessons.count
        current_user.user_courses.where(:course_id => @course.id).first.update_attributes(:passed => true)
      end
      result_passed = passed ? "Passed" : "Failed"
      redirect_to [:results, @course, @lesson, @testing], notice: "Test was finished. Result: #{result_passed}".html_safe
    end
  end

  def results
  end

  def load_instance
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @testing = Testing.find(params[:id])
    add_breadcrumb @course.category.name, category_path(@course.category)
    add_breadcrumb @course.name, course_path(@course)
    add_breadcrumb @lesson.name, course_lesson_path(@course, @lesson)
    add_breadcrumb @testing.name, tests_course_lesson_path(@course, @lesson)
  end

end
