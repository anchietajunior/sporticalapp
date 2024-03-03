# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?
  end

  def sign_in(user)
    Current.user = user
    cookies.encrypted.permanent[:user_id] = user.id
  end

  def sign_out
    Current.user = nil
    reset_session
    cookies.delete(:user_id)
  end

  def authenticate_user!
    redirect_to get_started_path if current_user.blank?
  end

  def redirect_if_authenticated
    redirect_to root_path if user_signed_in?
  end

  private

  def current_user
    Current.user ||= authenticate_user_from_session
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user_from_session
    User.find_by(id: cookies.encrypted[:user_id])
  end
end
