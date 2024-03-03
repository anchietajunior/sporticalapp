# frozen_string_literal: true

module ApplicationHelper
  def platform_identifier
    'turbo-native' if turbo_native_app?
  end

  def page_title
    return content_for(:turbo_native_title) || content_for(:title) || 'Sportical' if turbo_native_app?

    content_for(:title) || 'Sportical'
  end

  def humanized_text(text)
    text.humanize(capitalize: true)
  end
end
