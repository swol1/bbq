module ApplicationHelper
  def user_avatar(user)
    asset_path('user.png')
  end

  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank?
  end
end
