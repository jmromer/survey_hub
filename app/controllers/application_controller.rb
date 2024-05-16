# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user ||=
      if session.key?(:current_user_id)
        User.find_or_create_by(id: session[:current_user_id])
      else
        User.create.tap { session[:current_user_id] = _1.id }
      end
  end

  helper_method :current_user
end
