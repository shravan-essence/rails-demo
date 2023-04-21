class ApplicationController < ActionController::Base
	include Pundit::Authorization
	# def current_student
  #   @current_student ||= Student.find_by(id: session[:student_id])
  # end
  # helper_method :current_student
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
