class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def is_admin?
    redirect_to root_path, notice: 'You need Admin rights' unless current_user.admin?
  end
end
