class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :is_admin?, only: %i[create update destroy edit new]

  def is_admin?
    redirect_to root_path, notice: 'You need Admin rights' unless current_user.admin?
  end
end
