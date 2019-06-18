module ApplicationHelper

  def flash_message
    boostrap_alert_type = ['success','info','warning','danger']
    content_tag :div, class: "flash-messages" do
      flash.map do |key, value| 
        unless boostrap_alert_type.include?(key)
          key = 'info'
        end
        content_tag :div, class: "alert alert-dismissable alert-#{key} info-custom" do 
          content_tag(:span, '&times;'.html_safe, class: :close, 'data-dismiss' => 'alert') + value
        end
      end.join().html_safe
    end
  end

end
