class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :admin?, only: %i[create update destroy edit new], except: [index]

  def admin?
    redirect_to root_path, notice: 'You need Admin rights' if current_user.has_role? :admin
  end
end
