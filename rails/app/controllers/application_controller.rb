# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication

  before_action :authenticate_user!
end
