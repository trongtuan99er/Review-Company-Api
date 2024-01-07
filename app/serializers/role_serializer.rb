class RoleSerializer < BaseSerializer
  attributes :id, :role, :allow_all_action, :status, :allow_create,
             :allow_read, :allow_update,
             :created_at, :updated_at, :created_at_timestamp, :updated_at_timestamp
end