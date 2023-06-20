class StudentsController < ApplicationController

def index
  if params[:query].present?
    students = Student.where("first_name ILIKE :query OR last_name ILIKE :query", query: "%#{params[:query]}%")
  else
    students = Student.all
  end
  render json: students
end

  
  def grades
    grades = Student.order(grade: :desc)
    render json: grades
  end 

  def show
    student = Student.find_by(id: params[:id])
    render json: student 
  end 

end
