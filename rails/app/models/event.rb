# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  enum sport: {
    soccer: 0,
    tennis: 1,
    formula1: 2,
    basketball: 3,
    combat_sports: 4
  }

  enum broadcast_platform: {
    youtube: 0,
    twitch: 1,
    star_plus: 2,
    netflix: 3,
    prime_video: 4,
    hbo_max: 5,
    apple_tv: 6
  }

  validates :title, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }
  validates :event_date, presence: true
  validates :sport, presence: true, inclusion: { in: sports.keys }
  validates :broadcast_platform, presence: true, inclusion: { in: broadcast_platforms.keys }
end
