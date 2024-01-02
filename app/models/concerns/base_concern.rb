module BaseConcern
  extend ActiveSupport::Concern
  included do
    default_scope { where(is_deleted: false) }
  end
end