module ApplicationHelper

  def application_name
    "mindcast.io"
  end

  def application_description
    "mindcast.io"
  end

  def shorten_text(s, len)
    return s.squish[0..len].gsub(/\s\w+\s*$/, ' ...')
  end

  def format_time(t)
    Time.at(t)
  end

  def format_millis(t)
    "#{t / 1000.0}"
  end

  def has_next_page(count, page, limit)
    return true if count > page * limit
    return false
  end

end
