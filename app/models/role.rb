class Role < ApplicationRecord
  enum role: {
    user: 1,
    admin: 2,
    owner: 3,
    anomymous: 4,
  }

  enum status: {
    active: 1,
    inacive: 2,
    deleted: 3,
  }

  has_many :users
end
