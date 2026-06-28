class StudentsController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    @students = Student.all
    render json: @students, status: :ok
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      token = JsonWebToken.encode(student_id: @student.id)
      render json: { student: @student, token: token }, status: :created
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.permit(:name, :email, :password, :grade)
  end
end