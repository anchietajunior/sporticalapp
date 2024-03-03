# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, only: %i[get_started]

  def get_started; end
end
