# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'requires a valid email' do
    user = User.new
    assert_not user.valid?

    user.email = 'user.com'
    assert_not user.valid?

    user.email = 'user@email.com'
    assert_not user.valid?

    user.password = 'password'
    assert user.valid?
  end
end
