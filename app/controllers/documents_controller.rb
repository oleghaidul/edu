class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    add_breadcrumb "Home", :root_path
    add_breadcrumb @document.lesson.course.category.name, category_path(@document.lesson.course.category)
    add_breadcrumb @document.lesson.course.name, course_path(@document.lesson.course)
    add_breadcrumb @document.lesson.name, course_lesson_path(@document.lesson.course, @document.lesson)
    add_breadcrumb "Documents", documents_course_lesson_path(@document.lesson.course, @document.lesson)
    add_breadcrumb @document.name, document_path(@document)
  end
end
