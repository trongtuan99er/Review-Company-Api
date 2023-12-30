class UserSerializer < BaseSerializer
  attributes :id, :email, :created_at, :updated_at, :first_name, :last_name,
             :created_at_timestamp, :updated_at_timestamp
end
