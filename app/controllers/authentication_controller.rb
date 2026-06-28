class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    email_param = params[:email] || params.dig(:auth, :email) || params.dig(:login, :email)
    password_param = params[:password] || params.dig(:auth, :password) || params.dig(:login, :password)

    @student = Student.find_by(email: email_param)

    if @student&.authenticate(password_param)
      token = JsonWebToken.encode(student_id: @student.id)
      time = Time.now + 24.hours.to_i
      render json: { 
        token: token, 
        exp: time.strftime("%m-%d-%Y %H:%M"),
        student: { id: @student.id, name: @student.name, email: @student.email } 
      }, status: :ok
    else
      render json: { error: 'Invalid institutional email or password credentials' }, status: :unauthorized
    end
  end
end