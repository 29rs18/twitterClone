module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'notice'
      'alert-success'
    when 'alert'
      'alert-danger'
    else
      'alert-warning'
    end
  end
end
