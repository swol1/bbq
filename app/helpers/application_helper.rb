module ApplicationHelper
  def user_avatar(user)
    asset_path('user.png')
  end

  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank?
  end

  def bootstrap_errors_for(model, field)
    resource.errors[field].map do |error|
      "<span class='help-block no-buffer-bottom'>#{error}</span>"
    end.join.html_safe
  end

  def bootstrap_has_error(model, field)
    'has-error' if model.errors[field].present?
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
