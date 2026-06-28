class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_student = Student.find(@decoded[:student_id]) if @decoded
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end
end