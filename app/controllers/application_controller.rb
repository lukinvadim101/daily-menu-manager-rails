class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :is_admin?, only: %i[create update destroy edit new], except: [index]

  def is_admin?
    redirect_to root_path, notice: 'You need Admin rights' if current_user.has_role? :admin
  end
end
