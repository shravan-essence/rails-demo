class ApplicationController < ActionController::Base
  #before_action :prepare_exception_notifier
	include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  # def prepare_exception_notifier
  #   request.env["exception_notifier.exception_data"] = {
  #     current_student: current_student
  #   }
  # end
end
