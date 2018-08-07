module ApplicationHelper
  def bootstrap_alert_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-block'
    when 'notice'
      'alert-info'
    else
      "alert-#{flash_type.to_s}"
    end
  end

  def bs_nav_link(name, link)
    is_active = request.original_fullpath == link
    segmented_control('li', 'nav-item', 'active', is_active) do
      link_to name, link, class: 'nav-link'
    end
  end

  # Useful helper methods

  def render_time_normal(time_string)
    content_tag 'span', iso_time(time_string), class: 'moment-time-normal'
  end

  def render_time_from(time_string)
    content_tag 'span', iso_time(time_string), class: 'moment-time-from-now'
  end

  def render_time_to(time_string)
    content_tag 'span', iso_time(time_string), class: 'moment-time-to'
  end

  def segmented_control(tag, class_name, active_class, is_active, &block)
    class_string = is_active ? "#{class_name} #{active_class}" : class_name
    content_tag(tag, nil, {:class => class_string}, true, &block)
  end

  private

  def iso_time(time)
    time.to_time.iso8601
  end
end
