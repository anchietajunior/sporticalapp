# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @event = Event.new(
      title: 'Chelsea x Liverpool', championship: 'Premier League',
      url: 'https://example.com/event', event_date: Time.zone.now,
      sport: :soccer, broadcast_platform: :youtube, user: @user
    )
  end

  test 'should be valid' do
    assert @event.valid?
  end

  test 'title must be present' do
    @event.title = ' '
    assert_not @event.valid?
  end

  test 'event_date must be present' do
    @event.event_date = nil
    assert_not @event.valid?
  end

  test 'sport must be valid' do
    @event.sport = nil
    assert_not @event.valid?
    @event.sport = :invalid_sport
    assert_not @event.valid?
  end

  test 'broadcast_platform must be valid' do
    @event.broadcast_platform = nil
    assert_not @event.valid?
    @event.broadcast_platform = :invalid_platform
    assert_not @event.valid?
  end

  test 'url must be a valid URL' do
    invalid_urls = %w[http://invalid,com http:// invalid.com http://.com]
    invalid_urls.each do |invalid_url|
      @event.url = invalid_url
      assert_not @event.valid?, "#{invalid_url.inspect} should be invalid"
    end
  end

  test 'should belong to a user' do
    assert_respond_to @event, :user
    @event.user = nil
    assert_not @event.valid?
  end
end
