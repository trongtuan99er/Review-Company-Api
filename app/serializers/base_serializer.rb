class BaseSerializer < ActiveModel::Serializer

  def created_at_timestamp
    object.created_at.to_i
  end

  def updated_at_timestamp
    object.updated_at.to_i
  end
end
