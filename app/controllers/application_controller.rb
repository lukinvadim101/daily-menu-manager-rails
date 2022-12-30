# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action only: %i[new edit create update destroy] do
    redirect_to root_path, notice: 'You need Admin rights' if current_user && !current_user.admin?
  end
end
