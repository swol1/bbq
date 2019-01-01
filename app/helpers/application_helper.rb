module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_path('user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def form_errors_for(object = nil)
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
