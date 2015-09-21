class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  def index
    @students = Student.all
  end

  def show
    
  end

  def new
    @student=Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student,notice:'New student Information has been saved successfully'
    else
      render :new
    end
  end

  def update
     if @student.update(student_params)
      redirect_to @student,notice:'New student Information has been updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Students was removed successfully.'
  end
  
  private
  def set_student
    @student = Student.find(params[:id])
  end
  
  def student_params
    params.require(:student).permit(:name, :department, :subject)
  end
  
end