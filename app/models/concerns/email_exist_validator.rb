class EmailExistValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.user_id.nil? && User.where(email: value).present?
      record.errors[attribute] << 'уже принадлежит другому пользователю'
    end
  end
end