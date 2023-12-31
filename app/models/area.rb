class Area < ApplicationRecord
  enum status: {
    active: 1,
    inactive: 0
  }
  validates :name, presence: true
  validates :tenant_name, length: { minimum: 1, maximum: 100 }, uniqueness: true

  after_create :create_tenant
  after_destroy :drop_tenant

  def self.change_tenant! tenant_name
    Apartment::Tenant.switch! tenant_name
  end

  def self.current_tenant
    Apartment::Tenant.current
  end

  def change_tenant
    Apartment::Tenant.switch tenant_name do
      yield
    end
  end

  private

  def create_tenant
    Apartment::Tenant.create tenant_name
  end

  def drop_tenant
    Apartment::Tenant.drop tenant_name
  end
end
